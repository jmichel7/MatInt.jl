# MatInt
Integral matrices: Hermite, Smith normal forms and lattice functions 

This  package  provides  the  Smith  and  Hermite normal forms for integral
matrices,  the Diaconis-Graham  normal form  for sets  of generators  of an
abelian  group,  and  a  few  functions to  work  with integral matrices as
lattices.

The best way to ensure the validity of the results is to work with matrices
of  `SafeInt` from  the package  `SaferIntegers`, which  error on overflow.
Then repeat the computation with a wider type in case of an error.

For  the API, look at the docstrings of
`smith`,
`smith_transforms`,
`hermite`,
`hermite_transforms`,
`col_hermite`,
`col_hermite_transforms`,
`diaconis_graham`,
`baseInt`,
`complementInt`,
`lnullspaceInt`,
`solutionmatInt`,
`intersect_rowspaceInt`.

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://jmichel7.github.io/MatInt.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://jmichel7.github.io/MatInt.jl/dev/)
[![Build Status](https://github.com/jmichel7/MatInt.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jmichel7/MatInt.jl/actions/workflows/CI.yml?query=branch%3Amain)
