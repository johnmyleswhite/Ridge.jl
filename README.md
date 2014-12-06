Ridge.jl
========

# NOTICE

**This package is unmaintained. Its reliability is not guaranteed.**

# Introduction

Ridge regression and classification in Julia:

	using Ridge, Vega

	n, p = 1_000, 1_000
	X = randn(p, n)
	beta = randn(p)
	y = X' * beta + randn(n)

	beta_hat = ridge_regression(X, y, lambda = 1.0)

	cor(beta, beta_hat)

	plot(x = beta, y = beta_hat)

	lambdas = 10.0 .^ [-4.0:0.1:4.0]
	cors = Float64[]
	for l in lambdas
		beta_hat = ridge_regression(X, y, lambda = l)
		push!(cors, cor(beta, beta_hat))
	end
	plot(x = log(lambdas), y = cors, kind = :line)
