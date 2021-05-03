function CE = confidenceEllipse(x,y,alpha)
    % input
    % this function creates a confidence ellipse for a 2-D dataset
    % x: x-coordinates 
    % y: y-coordinates
    % alpha: our alpha value i.e. if we want to be 95% confident, we select
    % an alpha of 0.05 as 1-0.95=0.05
    % output:
    % this will plot an ellipse using the ellipse function. Will also give
    % a matrix containing values neccesary to plot the ellipse
    
    % calculate the centroid of our data by finding the mean values of our
    % X and Y vairables
    meanX = mean(x);
    meanY = mean(y);
    
    % find a chi-squared value for our polar-ellispe equation to be
    % equivalent to
    % we have two standard normal variables, so we will always have k=2 dof
    k = 2; %dof
    p = 1 - alpha; %
    % we can use the noncentral probabiltiy density function to calculate
    % our chi-squared value, use 0 to assume our distribution is centered
    % at 0
    chi = ncx2inv(p, k, 0);
    
    % we need to calculate the covariance matrix to find its eigenvalues,
    % these will be used later
    covariance = cov(x,y);
    % calculate the eigenvectors and eigenvalues
    [eigVec, eigVal] = eig(covariance);
    % create variables for eigenvectors for easy referencing
    eig1 = eigVec(:,1);
    eig2 = eigVec(:,2);
    % this removes those pesky zeroes in the output matrix
    eigVal = diag(eigVal);
    
    % calculate the axis values. the axis of an error ellipse is equal to
    % the square root of the chivalue of an error ellipse multiplied by the
    % eigenvalue. Remember, the eigenvector shows the direction of variance
    % and the eigenvalue shows its magnitude!
    % calculate the major axis
    a = sqrt(chi*eigVal(1));
    % calcualte the minor axis
    b = sqrt(chi*eigVal(2));
    
    % we can calculate the rotation angle by using the eigenvector
    % associated with the largest eigenvalue i.e. the eigenvector
    % corresponding to the axis with most variance. We can use
    % arctan(Eig-ycomponent/Eig-xcomponent)
    if  eigVal(2)>eigVal(1)
        theta = atan(eig1(2)/eig1(1));
    else
        theta = atan(eig2(2)/eig2(1));
    end
    
    %plot the confidence ellipse
    ellipse(a,b,meanX,meanY,theta, 72);
    
    % gives output containing all info necessary, in case you need to plot
    % it again later
    CE = [ a,b,meanX,meanY,theta]; 
end
    