<a id='MatInt' href='#MatInt'>#</a>
**`MatInt`** &mdash; *Module*.



Smith and Hermite normal forms for integral matrices, ported from GAP4, and Diaconis-Graham  normal form  for sets  of generators  of an abelian group, ported from GAP3/Chevie.

The  code ported  from GAP4  for NormalFormIntMat  is horrible (unreadable) like the original one.

The  best way to  make sure of  the validity of  the result is to work with matrices of SaferIntegers.

For  the API, look at the docstrings for `smith, smith_transforms, hermite, hermite_transforms,  col_hermite,  col_hermite_transforms, diaconis_graham, baseInt, complementInt, lnullspaceInt, solutionmatInt, intersect_rowspaceInt`


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L1-L15' class='documenter-source'>source</a><br>

<a id='MatInt.hermite' href='#MatInt.hermite'>#</a>
**`MatInt.hermite`** &mdash; *Function*.



`hermite(m::AbstractMatrix{<:Integer})`

returns  the row Hermite normal  form `H` of `m`,  a row equivalent integer upper  triangular form. If a pivot is the  first non-zero entry on a row of `H`,  the quadrant  below left  a pivot  is zero,  pivots are  positive and entries  above a  pivot are  nonnegative and  smaller than the pivot. There exists a unique invertible integer matrix `r` such that `rm==H`.

```julia-repl
julia> m=[1 15 28;4 5 6;7 8 9]
3×3 Matrix{Int64}:
 1  15  28
 4   5   6
 7   8   9

julia> hermite(m)
3×3 Matrix{Int64}:
 1  0  1
 0  1  1
 0  0  3
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L518-L540' class='documenter-source'>source</a><br>

<a id='MatInt.hermite_transforms' href='#MatInt.hermite_transforms'>#</a>
**`MatInt.hermite_transforms`** &mdash; *Function*.



`hermite_transforms(m::AbstractMatrix{<:Integer})`

The  row Hermite  normal form  `H` of  the `m`  is a row equivalent integer upper  triangular form. If a pivot is the  first non-zero entry on a row of `H`,  the quadrant  below left  a pivot  is zero,  pivots are  positive and entries  above a  pivot are  nonnegative and  smaller than the pivot. There exists   a  unique  invertible  integer   matrix  `r`  such  that  `rm==H`. `hermite_transforms`  returns  a  tuple  with  components  `.normal=H`  and `.rowtrans=r`.

```julia-repl
julia> m=[1 15 28;4 5 6;7 8 9]
3×3 Matrix{Int64}:
 1  15  28
 4   5   6
 7   8   9

julia> n=hermite_transforms(m)
(normal = [1 0 1; 0 1 1; 0 0 3], rowtrans = [-2 62 -35; 1 -30 17; -3 97 -55], rank = 3, signdet = 1)

julia> n.rowtrans*m==n.normal
true
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L545-L569' class='documenter-source'>source</a><br>

<a id='MatInt.col_hermite' href='#MatInt.col_hermite'>#</a>
**`MatInt.col_hermite`** &mdash; *Function*.



`col_hermite(m::AbstractMatrix{<:Integer})`

returns  the column Hermite  normal form `H`  of the integer  matrix `m`, a column  equivalent lower triangular form. If  a pivot is the first non-zero entry on a column of `H` (the quadrant above right a pivot is zero), pivots are  positive and entries left of a  pivot are nonnegative and smaller than the  pivot. There exists  a unique invertible  integer matrix `Q` such that `mQ==H`.

```julia-repl
julia> m=[1 15 28;4 5 6;7 8 9]
3×3 Matrix{Int64}:
 1  15  28
 4   5   6
 7   8   9

julia> col_hermite(m)
3×3 Matrix{Int64}:
 1  0  0
 0  1  0
 0  1  3
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L576-L599' class='documenter-source'>source</a><br>

<a id='MatInt.col_hermite_transforms' href='#MatInt.col_hermite_transforms'>#</a>
**`MatInt.col_hermite_transforms`** &mdash; *Function*.



`col_hermite_transforms(m::AbstractMatrix{<:Integer})`

The  column Hermite normal form  `H` of the integer  matrix `m` is a column equivalent lower triangular form. If a pivot is the first non-zero entry on a  column of  `H` (the  quadrant above  right a  pivot is zero), pivots are positive  and entries left of a pivot  are nonnegative and smaller than the pivot.  There  exists  a  unique  invertible  integer  matrix `Q` such that `mQ==H`. The function returns a named tuple with components `.normal=H` and `.rowtrans=Q`.

```julia-repl
julia> m=[1 15 28;4 5 6;7 8 9]
3×3 Matrix{Int64}:
 1  15  28
 4   5   6
 7   8   9

julia> n=col_hermite_transforms(m)
(normal = [1 0 0; 0 1 0; 0 1 3], coltrans = [-1 13 -50; 2 -27 106; -1 14 -55], rank = 3, signdet = 1)

julia> m*n.coltrans==n.normal
true
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L604-L628' class='documenter-source'>source</a><br>

<a id='MatInt.smith' href='#MatInt.smith'>#</a>
**`MatInt.smith`** &mdash; *Function*.



`smith(m::AbstractMatrix{<:Integer})`

computes  the Smith normal form  `S` of `m`, the  unique equivalent (in the sense  that  there  exist  unimodular  integer  matrices  `P,  Q` such that `Q*m*P==S`) diagonal matrix such that `Sᵢ,ᵢ` divides `Sⱼ,ⱼ` for `i≤j`.

```julia-repl
julia> m=[1 15 28 7;4 5 6 7;7 8 9 7]
3×4 Matrix{Int64}:
 1  15  28  7
 4   5   6  7
 7   8   9  7

julia> smith(m)
3×4 Matrix{Int64}:
 1  0  0  0
 0  1  0  0
 0  0  3  0
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L635-L655' class='documenter-source'>source</a><br>

<a id='MatInt.smith_transforms' href='#MatInt.smith_transforms'>#</a>
**`MatInt.smith_transforms`** &mdash; *Function*.



`smith_transforms(m::AbstractMatrix{<:Integer})`

The  Smith normal form of `m` is  the unique equivalent diagonal matrix `S` such  that `Sᵢ,ᵢ` divides `Sⱼ,ⱼ` for  `i≤j`. There exist unimodular integer matrices  `P, Q` such that `Q*m*P==S`.  This function returns a named tuple with `.normal=S`, `.rowtrans=Q` and `.coltrans=P`.

```julia-repl
julia> m=[1 15 28 7;4 5 6 7;7 8 9 7]
3×4 Matrix{Int64}:
 1  15  28  7
 4   5   6  7
 7   8   9  7

julia> n=smith_transforms(m)
(normal = [1 0 0 0; 0 1 0 0; 0 0 3 0], coltrans = [1 0 -1 -84; 0 1 -1 175; 0 0 1 -91; 0 0 0 1], rowtrans = [-2 62 -35; 1 -30 17; -3 97 -55], rank = 3, signdet = nothing)

julia> n.rowtrans*m*n.coltrans==n.normal
true
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L658-L679' class='documenter-source'>source</a><br>

<a id='MatInt.diaconis_graham' href='#MatInt.diaconis_graham'>#</a>
**`MatInt.diaconis_graham`** &mdash; *Function*.



`diaconis_graham(m::Matrix{<:Integer}, moduli::Vector{<:Integer})`

returns the normal  form defined  in [Diaconis-Graham1999](biblio.htm#dg99) for  the set of generators  defined by `m` of  the abelian group defined by `moduli`.

`moduli`  should  have  positive  entries  such  that `moduli[i+1]` divides `moduli[i]` for all `i`, representing the abelian group `A=ℤ/moduli[1]×…×ℤ/moduli[n]`, where `n=length(moduli)`.

`m`  should have `n` columns, and each  line, with the `i`-th element taken `mod  moduli[i]`, represents  an element  of `A`;  the set  of lines of `m` should generate `A`.

The  function returns 'nothing'  if the lines  of `m` do  not generate `A`. Otherwise it returns a named tuple `r` with fields

`r.normal`:  the Diaconis-Graham normal form, a matrix of same shape as `m` where  either the first `n` lines are the identity matrix and the remaining lines  are `0`,  or `length(m)=n`  and `.normal`  differs from the identity matrix only in the entry `.normal[n,n]`, which is prime to `moduli[n]`.

`r.rowtrans`: unimodular matrix such that `r.normal==mod.(r.rowtrans*m,moduli')`

Here is an example:

```julia-repl
julia> r=diaconis_graham([3 0;4 1],[10,5])
(rowtrans = [-13 10; 4 -3], normal = [1 0; 0 2])

julia> r.normal==mod.(r.rowtrans*[3 0;4 1],[10,5]')
true
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L951-L985' class='documenter-source'>source</a><br>

<a id='MatInt.baseInt' href='#MatInt.baseInt'>#</a>
**`MatInt.baseInt`** &mdash; *Function*.



`baseInt(m::Matrix{<:Integer})`

returns  a list of vectors that forms a  basis of the integral row space of `m`, i.e. of the set of integral linear combinations of the rows of `m`.

```julia-repl
julia> m=[1 2 7;4 5 6;10 11 19]
3×3 Matrix{Int64}:
  1   2   7
  4   5   6
 10  11  19

julia> baseInt(m)
3×3 Matrix{Int64}:
 1  2   7
 0  3   7
 0  0  15
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L686-L705' class='documenter-source'>source</a><br>

<a id='MatInt.complementInt' href='#MatInt.complementInt'>#</a>
**`MatInt.complementInt`** &mdash; *Function*.



`complementInt(full::Matrix{<:Integer}, sub::Matrix{<:Integer})`

Let  `M` be the integral row module of  `full` and let `S`, a submodule of `M`,  be the integral row  module of `sub`. This  function computes a free basis for `M` that extends `S`, that is, if the dimension of `S` is `n` it determines  a basis  `B={b₁,…,bₘ}` for  `M`, as  well as `n` integers `xᵢ` such that the `n` vectors `sᵢ:=xᵢ⋅bᵢ` form a basis for `S`.

It returns a named tuple with the following components:

  * `complement` a matrix whose lines are `bₙ₊₁,…,bₘ`.
  * `sub` a matrix whose lines are the `sᵢ` (a basis for `S`).
  * `moduli` the factors `xᵢ`.

```julia-repl
julia> m=one(zeros(Int,3,3))
3×3 Matrix{Int64}:
 1  0  0
 0  1  0
 0  0  1

julia> n=[1 2 3;4 5 6]
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> complementInt(m,n)
(complement = [0 0 1], sub = [1 2 3; 0 3 6], moduli = [1, 3])
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L739-L768' class='documenter-source'>source</a><br>

<a id='MatInt.lnullspaceInt' href='#MatInt.lnullspaceInt'>#</a>
**`MatInt.lnullspaceInt`** &mdash; *Function*.



`lnullspaceInt(m::Matrix{<:Integer})

returns  a matrix whose rows form a  basis of the integral lnullspace of `m`,  that is of elements  of the left nullspace  of `m` that have integral entries.

```julia-repl
julia> m=[1 2 7;4 5 6;7 8 9;10 11 19;5 7 12]
5×3 Matrix{Int64}:
  1   2   7
  4   5   6
  7   8   9
 10  11  19
  5   7  12

julia> MatInt.lnullspaceInt(m)
2×5 Matrix{Int64}:
 1  18   -9  2  -6
 0  24  -13  3  -7
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L783-L804' class='documenter-source'>source</a><br>

<a id='MatInt.intersect_rowspaceInt' href='#MatInt.intersect_rowspaceInt'>#</a>
**`MatInt.intersect_rowspaceInt`** &mdash; *Function*.



`intersect_rowspaceInt(m::Matrix{<:Integer}, n::Matrix{<:Integer})`

returns  a  matrix  whose  rows  forms  a  basis of the intersection of the integral row spaces of `m` and `n`.

```julia-repl
julia> mat=[1 2 7;4 5 6;10 11 19]; nat=[5 7 2;4 2 5;7 1 4]
3×3 Matrix{Int64}:
 5  7  2
 4  2  5
 7  1  4

julia> intersect_rowspaceInt(mat,nat)
3×3 Matrix{Int64}:
 1  5  509
 0  6  869
 0  0  960
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L711-L730' class='documenter-source'>source</a><br>

<a id='MatInt.solutionmatInt' href='#MatInt.solutionmatInt'>#</a>
**`MatInt.solutionmatInt`** &mdash; *Function*.



`solutionmatInt(mat::Matrix{<:Integer}, v::Vector{<:Integer})`

returns  a  vector  `x`  with  integer  entries  that  is a solution of the equation `mat'*x=vec`. It returns `false` if no such vector exists.

```julia-repl
julia> mat=[1 2 7;4 5 6;7 8 9;10 11 19;5 7 12]
5×3 Matrix{Int64}:
  1   2   7
  4   5   6
  7   8   9
 10  11  19
  5   7  12

julia> solutionmat(mat,[95,115,182])
5-element Vector{Rational{Int64}}:
  47//4
 -17//2
  67//4
   0//1
   0//1

julia> solutionmatInt(mat,[95,115,182])
5-element Vector{Int64}:
  2285
 -5854
  4888
 -1299
     0
```


<a target='_blank' href='https://github.com/jmichel7/MatInt.jl/blob/0c315e33332b46ee30621b432511d78c6ff95ee7/src/MatInt.jl#L810-L841' class='documenter-source'>source</a><br>

