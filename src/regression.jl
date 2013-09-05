# Assumes that data is given as a real-valued matrix
# with size: features x observations. Finds the equivalent
# to β = (X * X' + λ I)^-1 X' y, where we already have data
# transposed: β = (X' * X + λ I)^-1 X y.
function ridge_regression{S <: Real,
	                      T <: Real}(X::Matrix{S},
	                                 y::Vector{T};
	                                 lambda::Real = 1.0)
	p, n = size(X)
	if length(y) != n
		error("X and y must have the same number of observations")
	end
	XXt = A_mul_Bt(X, X)
	for i in 1:p
		XXt[i, i] += lambda
	end
	# Should really be SymmetricPositiveDefinite
	XXt = Symmetric(XXt)
	β = XXt \ (X * y)
	return β
end
