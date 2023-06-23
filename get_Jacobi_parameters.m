function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
  
  [m n] = size(Link);
  G = zeros(m - 2, n - 2);
  c = zeros(m - 2, 1);
  c = Link(1:m-2, n-1);
  G = Link(1:m-2, 1:n-2);
endfunction
