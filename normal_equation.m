function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  % NOT WORKING PROPERLY
  
  
  
  % This function calculates the coefficients theta_1, ..., theta_n in R, using
  % the conjugate gradient method. Also, theta_0 = 0.
  % This function should return a Theta vector with all calculated coefficients.
  % If the system matrix is not positive definite, then Theta will store only 0 values and will be
  % returned directly. It is guaranteed that iter will be chosen appropriately.
  
    % Initialize Theta
    Theta = zeros(size(FeaturesMatrix,2),1);
    
    % Calculate the matrix A
    A = FeaturesMatrix' * FeaturesMatrix;
    
    % Calculate the vector b
    b = FeaturesMatrix' * Y;
    
    % Use the conjugate gradient method to solve the system Ax = b
    [x, converged] = conjugate_gradient(A, b, zeros(size(A,1),1), tol, iter);
    
    % If the conjugate gradient method did not converge, return Theta with 0 values
    if ~converged
      Theta = zeros(size(FeaturesMatrix,2),1);
      return;
    end
    
    % Set the calculated coefficients to Theta
    Theta = x;
  
    % Set theta_0 to 0
    Theta(1) = 0;
  endfunction
  
  % The conjugate gradient method
  function [x, converged] = conjugate_gradient(A, b, x_0, tol, max_iter)
    % Initialize variables
    r_0 = b - A*x_0;
    v_1 = r_0;
    x = x_0;
    tol_squared = tol^2;
    k = 1;
  
    % Iterate until convergence or until max_iter iterations
    while k <= max_iter && norm(r_0)^2 > tol_squared
      t_k = norm(r_0)^2 / (v_1' * A * v_1);
      x = x + t_k * v_1;
      r_k = r_0 - t_k * A * v_1;
      s_k = norm(r_k)^2 / norm(r_0)^2;
      v_k = r_k + s_k * v_1;
      r_0 = r_k;
      v_1 = v_k;
      k = k + 1;
    endwhile
  
    % If the conjugate gradient method converged, set converged to true
    if k <= max_iter
      converged = true;
    else
      converged = false;
    endif
  endfunction