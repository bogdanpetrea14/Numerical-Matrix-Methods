function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

	steps = 0;
	err = tol + 1;
	while (1)
		x = G * x0 + c;
		steps++;
		err = norm(x - x0);
		if (err <= tol) || (steps == (max_steps + 1))
			return;
		endif
		x0 = x;
	endwhile
endfunction
