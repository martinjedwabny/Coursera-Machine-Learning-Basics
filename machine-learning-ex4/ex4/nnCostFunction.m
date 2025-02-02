function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Theta1 has size 25 x 401
% Theta2 has size 10 x 26
% X has size 5000 x 400

% Part 1

a1 = [ones(m, 1) X]; % 5000 x 401

z2 = a1 * Theta1'; % 5000 x 25
a2 = [ones(m, 1) sigmoid(z2)]; % 5000 x 26

z3 = a2 * Theta2'; % 5000 x 10
a3 = sigmoid(z3); % 5000 x 10

for i = 1:m
	logs = - log(1 .- a3(i,:));
	logs(y(i)) = - log(a3(i,y(i)));
	J += (1 / m) * sum(logs);
end

J += (lambda / (2 * m)) * sum(sum(Theta1(:,2:size(Theta1,2)) .^ 2));
J += (lambda / (2 * m)) * sum(sum(Theta2(:,2:size(Theta2,2)) .^ 2));

% Part 2

% For each input sample
for t = 1:m
	% 1. Feed forward
	a1 = [1 X(t,:)]; % 1 x 401
	z2 = a1 * Theta1'; % 1 x 25
	a2 = [1 sigmoid(z2)]; % 1 x 26
	z3 = a2 * Theta2'; % 1 x 10
	a3 = sigmoid(z3); % 1 x 10
	% 2. Calculate error at output unit
	yt = zeros(1,size(a3,2)); % 1 x 10
	yt(y(t)) = 1;
	delta_3 = (a3 - yt)'; % 10 x 1
	% 3. Hidden layer error
	delta_2 = Theta2' * delta_3; % 26 x 1
	delta_2 = delta_2(2:end); % 25 x 1
	delta_2 = delta_2 .* sigmoidGradient(z2)'; % 25 x 1
	% 4. Accumulate gradients
	Theta2_grad += (1 / m) .* (delta_3 * a2); % 10 x 26
	Theta1_grad += (1 / m) .* (delta_2 * a1); % 25 x 401
end

% Part 3

% Regularize gradient
Theta2_grad += (lambda / m) .* [zeros(size(Theta2,1),1) Theta2(:,2:end)];
Theta1_grad += (lambda / m) .* [zeros(size(Theta1,1),1) Theta1(:,2:end)];

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
