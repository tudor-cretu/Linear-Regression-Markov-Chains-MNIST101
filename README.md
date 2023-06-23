<h5 align = center> Copyright Cretu Mihnea Tudor 315CAa 2022 - 2023 </h5> 
<h5 align = center> 1st Homework for Numerical Methods Class, Year I - Faculty of Automation Control and Computer Science, Polytechnic University of Bucharest </h5>
<br>
<h1 align = center> Markov is coming, Linear Regression, MNIST-101 </h1>
<br>
<h2> 1) Markov is coming </h2>
<br>
<p> This program is used to create a graph representation of a labyrinth, and find the shortest path from the starting point to the end point. Here is a brief description of each function: <p>

<li><b>parse_labyrinth(filename) </b>
<p>This function takes in a filename as input and returns a matrix representing the labyrinth. The input file should contain the dimensions of the matrix followed by the elements of the matrix in row-major order. This function reads the file and constructs a matrix with the specified dimensions.</p>

<li><b>get_adjacency_matrix(Labyrinth)</b>
<p>This function takes in a matrix representing a labyrinth and returns a sparse adjacency matrix representing the graph of the labyrinth. The graph is represented as a square matrix of size n * m + 2, where n and m are the number of rows and columns of the labyrinth matrix, respectively. The two extra nodes represent the source and sink nodes of the graph.</p>

<li><b>get_link_matrix(Labyrinth)</b>
<p>This function takes in a matrix representing a labyrinth and returns a link matrix representing the probabilities of moving from one node to another. This function first calls get_adjacency_matrix to obtain the adjacency matrix, and then computes the link matrix based on the number of available edges from each node.</p>

<li><b>decode_path(path, lines, cols)</b>
<p>This function takes in a path represented as a vector of node indices and returns a matrix of (x,y) pairs representing the positions of the nodes in the labyrinth. The input path vector should exclude the last element, which is the WIN state. The parameters lines and cols specify the number of rows and columns of the labyrinth, respectively.</p>

<li><b>get_Jacobi_parameters</b>
<p>This function takes in a link matrix and computes the Jacobi parameters G and c. The Jacobi method is a numerical method for solving linear systems of equations, and the Jacobi parameters are used to control the convergence of the method.</p>

<li><b>heuristic_greedy</b>
<p>This function takes in the adjacency matrix, a start position, the vector of probabilities and returns a valid path to the <i>WIN</i> scenario</p>

<li><b>perform_iterative</b>
<p>The perform_iterative function takes a matrix G and a vector c representing the coefficients of a linear system, an initial solution vector x0, a tolerance value tol, and a maximum number of iterations max_steps. The function returns the final solution vector x, the last calculated error err (as the Euclidean norm of the difference between two consecutive solutions), and the actual number of performed iterations steps.

The function performs an iterative method to find an approximate solution for the linear system by repeatedly applying the iteration formula x = G*x + c until either the error is less than the specified tolerance or the maximum number of iterations is reached. The initial solution is set to x0.</p>
<br>
<p>These functions can be used together to solve the shortest path problem in a labyrinth. The input is a matrix representing the labyrinth, and the output is a vector of node indices representing the shortest path from the starting point to the end point. The decode_path function can then be used to obtain the (x,y) coordinates of the nodes in the path.

These functions provide a useful set of tools for solving the shortest path problem in a labyrinth. With these functions, it is easy to represent the labyrinth as a graph, compute the probabilities of moving from one node to another, and find the shortest path from the starting point to the end point.</p>
<br> 
<h2> 2) Linear Regression </h2>
<br>
<p>Linear regression analysis is used to predict the value of a variable based on the value of another variable. The variable wanted to be predicted is called the dependent variable. The variable used to predict the other variable's value is called the independent variable. The program is capable of reading data from both .csv and .txt files, and it can handle datasets with different formats.</p>

<li><b>parse_data_set_file(file_path)</li></b>
<p>This function reads a data set from a text file and returns a matrix of features and a vector of labels.</p>

<li><b>parse_csv_file(file_path)</li></b>
<p>This function reads a data set from a CSV file and returns a matrix of features and a vector of labels.</p>

<li><b>prepare_for_regression(InitialMatrix)</li></b>
<p>This function preprocesses the data and creates a feature matrix.</p>

<li><b>linear_regression_cost_function(Theta, Y, FeatureMatrix)</li></b>
<p>This function computes the cost function for linear regression.</p>

<li><b>ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)</li></b>
<p>This function computes the cost function for ridge regression.</p>

<li><b>lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)</li></b>
<p>This function computes the cost function for Lasso regression.</p>
<br>
<b>Inputs</b>
<li>file_path: the path to the data file
<li>InitialMatrix: the matrix of features
<li>Theta: the vector of weights
<li>Y: the vector of labels.
<li>FeatureMatrix: the feature matrix.
<li>lambda: the regularization parameter that controls the amount of shrinkage applied to the regression coefficients
<br>
<br>
<b>Outputs</b>
<li>Y: the vector of labels
<li>InitialMatrix: the matrix of features
<li>FeatureMatrix: the feature matrix
<li>Error: the error of the cost function
<br>
<br>
<br>
<h2> 3) MNIST-101 </h2>
<br>
<p>This program can be used to build a neural network, train it, and predict outputs. Here is a summary of the different functions and their purpose:</p>

<li><b>load_dataset(path)</b></li>
<p>This function loads a dataset from a .mat file given by path. It extracts the training examples and their corresponding labels and returns them as X and y.</p>

<li><b>initialize_weights(L_prev, L_next)</b></li>
<p>This function initializes the weights of the neural network between two layers of sizes L_prev and L_next.</p>

<li><b>split_dataset(X, y, percent)</li></b>
<p>This function splits the dataset into training and test sets, with a fraction of percent of the examples being in the training set. It shuffles the examples before splitting.</p>

<li><b>predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)</li></b>
<p>This function predicts the classes of test examples given as input. It uses the trained weights and the sizes of the layers to make the predictions.</p>

<li><b>sigmoid(x)</li></b>
<p>This is a vectorized function for the sigmoid calculation. It returns the sigmoid of the input.</p>

<li><b>fmincg(f, X, options, P1, P2, P3, P4, P5)</li></b>
<p>This is a function used for optimization, specifically for a form of the conjugate gradient method. It takes as input a function f that returns the function value and partial derivatives, a starting point X, and different options. It returns the found solution X, a vector of function values fX indicating the progress made, and the number of iterations used.</p>
<br>
<br>
<p>For more details about the code's implementation, comments regarding it are shown in each function of the programs.</p>