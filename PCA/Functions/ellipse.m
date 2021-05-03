function ellipseCoords = ellipse(a, b, x, y, theta, steps)
    % input:
    % this function returns coordinates for plotting an ellipse
    % parameter a is the major axis
    % parameter b is the minor axis
    % parameter x is the x-coordinate for the center
    % parameter y is the y-coordiante for the center
    % parameter theta is the angle in RADIANS, this function does NOT
    % take degrees as an input!!!
    % amount of steps used in drawing the ellipse, optional argument
    % where if no  input is supplied, 72 is default parameter
    %
    % output:
    % a {steps}x2 matrix consisting of the coordinates for plotting an ellipse
    
    % sets mininum and maximum amount of arguments, if steps not specified,
    % defaults to 72 steps
    narginchk(5,6);
    if nargin<6
        steps = 72;
    end
    
    % calculate sin and cos of our angle in radians
    sinbeta = sin(theta);
    cosbeta = cos(theta);
    
    % calculate the "eccentric anomaly" of our ellipse
    % create equally spaced points between 0 an 2pi using our steps
    alpha = linspace(0, 2*pi, steps)';
    sinalpha = sin(alpha);
    cosalpha = cos(alpha);
    
    % calculate rotated points of our ellipse using paramtric form 
    X = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
    Y = y + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);
    
    % matrix containing representative points of our ellipse
    ellipseCoords = [X, Y];
    
    %plot our ellipse
    plot(ellipseCoords(:,1),ellipseCoords(:,2))
end
    
    
    
   
    
    
    
    
    
    
        