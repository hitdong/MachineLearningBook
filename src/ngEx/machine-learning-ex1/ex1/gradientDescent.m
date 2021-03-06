function [theta, J_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);


% theta 的数量 
n = length(theta);

% theta 的历史数据用来演示线性规划中的变化过程
theta_history = zeros(num_iters, n);


for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    tmpTheta = theta;
    
    for j = 1 : n
    
      sum = 0;
      
      for i = 1:m
        % h(x) = θ'X 因为x 是列向量所以需要装置
        sum += (theta'*X(i, :)' - y(i)) * X(i,j);
      end
      
      tmpTheta(j) = theta(j) - alpha * sum/m;
      
      
    end
    
    theta = tmpTheta;
    

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    theta_history(iter, :) = theta;

end

end
