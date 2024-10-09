------> marcov-is-coming(task1)

-parse_labyrinth:
    First of all, we open the file from the given path in read mode.
    The first line containing the size of the matrix to be saved in
    Labyrinth are read(but as strings, so we need to transform into
    decimal/numbers). Then, we read m lines from the file, and transform into decimals, so that we can save them into the matrix. Before closing the program, we close the file.

-get_adjency_matrix:
    In variable aux, we save each number of the matrix given and transform it into a decimal number. The function dec2bin transforms it into an array of the dimension 1x4. Then, there are 4 cases for each direction where there is a posible path through the labyrinth. If the position is not on the corner of the matrix, we put a 1 at the position (i,j), but at (j,i) as well. But, if it is on the corner, we put a one only from that position to win/lose.
    (win, win) and (lose, lose) will have a 1 on their position (win is the size + 1 and lose is +2).

-get_link_matrix
    This is the matrix that calculates the probability of the path between 2 cells. First of all, this is basically the same algorithm as the previous one, but it also calculates the number of path that might follow. After that, to calculate the probability of a path, we divide 1 by that number and that is the probability for each way. If the next cell could be WIN, then the probability of that path is 1 and will be eventually chosen.

-get_Jacobi_parameters + perform_iterative
    This just extract the parameters for Jacobi implementation. After that, it follows the Jacobi algorithm to calculate the solution of the system.

-heuristic_greedy
    Here is the implementation of the pseudo-code that has been given. The algorithm initiate the variable path with start_position and mark it as visited. After that, we find the neighbours of the last position that has been saved, and then find the next neighbour to be visited. If the next neighbour is WIN or LOSE, we end the search, or if the neibours vector is empty, we return from the function.

-decode_path
    The path given contains the WIN and LOSE state, so we know that we are reading lenght(path) - 1 elements.
    For each of them, we calculate the row and the collum and save them into the decode_path matrix.

<------ end_first_explanation


------>linear-regression(task2)

-parse_data_set_file
    We open the file in the read mode and then we read the dimensions of the matrix to be saved in InitialMatrix. In the file, we know that the firs collumn is for the Y vector, so we read the whole line and the first element is saved in Y as a decimal number, and the rest of the line is copied into the InitialMatrix(which has been initialized as a cell matrix = "it can contain both decimal and strings values").

-prepare_for_regression
    First of all, we test to see if the firs collumn of the matrix is an empty cell vector, and if so, we delete it. Then, we initialize the FeatureMatrix with 0  values and apply the transformation on the InitialMatrix(yes becomes 1, no 0, furnished 0,0, and so on). If the the value from the InitialMatrix is already a number, it is copied to FeatureMatrix.

-parse_csv_file
    Just the same principle as the first function, but this time, after reading the line, we have to split it after "," so that we could have a matrix.

-linear_regression_cost_function and lasso_regression_cost_function
    The differences between those 2 is that the second one is more precise than the first one. Both use a Theta matrix and an aux to calculate the error of the cost.

-gradient_descent
    It calculates the weights vector using the previous functions. (A given formula).

-normal_equation
    First we verify if the matrix is positive defined and afterwards we continue the algorithm. We do the same operations until we reach the max number of iterations given or until the solution is ok for us.

-ridge_regression_cost_function
    Basically, alike the linear and lasso functions for cost.
<------ end_second_explanation

------>mnist-101(task3)

-load_dataset
    In the variable data, we read the whole documents(which has been organized so that we could easily read data from it) and extract X values and y values just like data would be a structure.

-split_dataset
    In this function, we split the data in 2, a part for test and a part for training, percent given in the function. Before that, we have to shuffle the lines of the matrix so that the follow function could work correctly.

-initialize_weights
    We initialize the matrix with values between (-epsilon, epsilon). Epsilon is calculated by the aux and epsilon formulas. For the matrix, we use rand function to generate values between 0 and 1, but we multiply those by 2 and substract 1 to obtain (-1,1) and then multiply again by epsilon.

-cost_function
    First, we get the Theta1 and Theta2 matrixes by reshaping the params vector, which contains both matrixes, but as a collumn vector. After, we perform forward propagation, in which we calculated the last matrix, a3, using Theta1 and Theta2, and the matrix which retains the number we need(in y collumn vector, we have values from 0 to 9, so this is similar to a matrix of the same rows and 10 collumns. For example, if we had 3 on the first position in y, in the y_matrix we'd have (0 0 1 0 0 0 0 0 0 0)), and then calculate J. Afther, we calculate using formulas the components of the grad vector, which has the same length as params.

-predict_classes
    It uses the forward propagation part of the cost_function and, in the end, it takes the maximum value of each line  and saves it in classes.

<------ end_third_explanation