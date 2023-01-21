# auto-generated tests from julia-repl docstrings
using Test, Gapjm
#include("../tools/Gap4.jl")
function mytest(f::String,a::String,b::String)
  println(f," ",a)
  omit=a[end]==';'
  a=replace(a,"\\\\"=>"\\")
  a=repr(MIME("text/plain"),eval(Meta.parse(a)),context=:limit=>true)
  if omit a="nothing" end
  a=replace(a,r" *(\n|$)"s=>s"\1")
  a=replace(a,r"\n$"s=>"")
  b=replace(b,r" *(\n|$)"s=>s"\1")
  b=replace(b,r"\n$"s=>"")
  i=1
  while i<=lastindex(a) && i<=lastindex(b) && a[i]==b[i]
    i=nextind(a,i)
  end
  if a!=b print("exec=$(repr(a[i:end]))\nmanl=$(repr(b[i:end]))\n") end
  a==b
end
@testset verbose = true "Gapjm" begin
@testset "MatInt.jl" begin
@test mytest("MatInt.jl","MatInt.Gcdex(123,66)","(gcd = 3, coeff = [7 -13; -22 41])")
@test mytest("MatInt.jl","MatInt.Gcdex(0,-3)","(gcd = 3, coeff = [0 -1; 1 0])")
@test mytest("MatInt.jl","MatInt.Gcdex(0,0)","(gcd = 0, coeff = [1 0; 0 1])")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","MatInt.NormalFormIntMat(m,REDDIAG=true,ROWTRANS=true)","Dict{Symbol, Any} with 6 entries:\n  :rowQ     => [-2 62 -35; 1 -30 17; -3 97 -55]\n  :normal   => [1 0 1; 0 1 1; 0 0 3]\n  :rowC     => [1 0 0; 0 1 0; 0 0 1]\n  :rank     => 3\n  :signdet  => 1\n  :rowtrans => [-2 62 -35; 1 -30 17; -3 97 -55]")
@test mytest("MatInt.jl","r=MatInt.NormalFormIntMat(m,TRIANG=true,ROWTRANS=true,COLTRANS=true)","Dict{Symbol, Any} with 9 entries:\n  :rowQ     => [-2 62 -35; 1 -30 17; -3 97 -55]\n  :normal   => [1 0 0; 0 1 0; 0 0 3]\n  :colQ     => [1 0 -1; 0 1 -1; 0 0 1]\n  :coltrans => [1 0 -1; 0 1 -1; 0 0 1]\n  :rowC     => [1 0 0; 0 1 0; 0 0 1]\n  :rank     => 3\n  :signdet  => 1\n  :rowtrans => [-2 62 -35; 1 -30 17; -3 97 -55]\n  :colC     => [1 0 0; 0 1 0; 0 0 1]")
@test mytest("MatInt.jl","r[:rowtrans]*m*r[:coltrans]","3×3 Matrix{Int64}:\n 1  0  0\n 0  1  0\n 0  0  3")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","MatInt.TriangulizedIntegerMat(m)","3×3 Matrix{Int64}:\n 1  15  28\n 0   1   1\n 0   0   3")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","n=MatInt.TriangulizedIntegerMatTransform(m)","Dict{Symbol, Any} with 6 entries:\n  :rowQ     => [1 0 0; 1 -30 17; -3 97 -55]\n  :normal   => [1 15 28; 0 1 1; 0 0 3]\n  :rowC     => [1 0 0; 0 1 0; 0 0 1]\n  :rank     => 3\n  :signdet  => 1\n  :rowtrans => [1 0 0; 1 -30 17; -3 97 -55]")
@test mytest("MatInt.jl","n[:rowtrans]*m==n[:normal]","true")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","hermite(m)","3×3 Matrix{Int64}:\n 1  0  1\n 0  1  1\n 0  0  3")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","n=hermite_transforms(m)","(normal = [1 0 1; 0 1 1; 0 0 3], rowtrans = [-2 62 -35; 1 -30 17; -3 97 -55], rank = 3, signdet = 1)")
@test mytest("MatInt.jl","n.rowtrans*m==n.normal","true")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","col_hermite(m)","3×3 Matrix{Int64}:\n 1  0  0\n 0  1  0\n 0  1  3")
@test mytest("MatInt.jl","m=[1 15 28;4 5 6;7 8 9]","3×3 Matrix{Int64}:\n 1  15  28\n 4   5   6\n 7   8   9")
@test mytest("MatInt.jl","n=col_hermite_transforms(m)","(normal = [1 0 0; 0 1 0; 0 1 3], coltrans = [-1 13 -50; 2 -27 106; -1 14 -55], rank = 3, signdet = 1)")
@test mytest("MatInt.jl","m*n.coltrans==n.normal","true")
@test mytest("MatInt.jl","m=[1 15 28 7;4 5 6 7;7 8 9 7]","3×4 Matrix{Int64}:\n 1  15  28  7\n 4   5   6  7\n 7   8   9  7")
@test mytest("MatInt.jl","smith(m)","3×4 Matrix{Int64}:\n 1  0  0  0\n 0  1  0  0\n 0  0  3  0")
@test mytest("MatInt.jl","m=[1 15 28 7;4 5 6 7;7 8 9 7]","3×4 Matrix{Int64}:\n 1  15  28  7\n 4   5   6  7\n 7   8   9  7")
@test mytest("MatInt.jl","n=smith_transforms(m)","(normal = [1 0 0 0; 0 1 0 0; 0 0 3 0], coltrans = [1 0 -1 -84; 0 1 -1 175; 0 0 1 -91; 0 0 0 1], rowtrans = [-2 62 -35; 1 -30 17; -3 97 -55], rank = 3, signdet = nothing)")
@test mytest("MatInt.jl","n.rowtrans*m*n.coltrans==n.normal","true")
@test mytest("MatInt.jl","m=[1 2 7;4 5 6;10 11 19]","3×3 Matrix{Int64}:\n  1   2   7\n  4   5   6\n 10  11  19")
@test mytest("MatInt.jl","baseInt(m)","3×3 Matrix{Int64}:\n 1  2   7\n 0  3   7\n 0  0  15")
@test mytest("MatInt.jl","mat=[1 2 7;4 5 6;10 11 19]; nat=[5 7 2;4 2 5;7 1 4]","3×3 Matrix{Int64}:\n 5  7  2\n 4  2  5\n 7  1  4")
@test mytest("MatInt.jl","intersect_rowspaceInt(mat,nat)","3×3 Matrix{Int64}:\n 1  5  509\n 0  6  869\n 0  0  960")
@test mytest("MatInt.jl","m=one(zeros(Int,3,3))","3×3 Matrix{Int64}:\n 1  0  0\n 0  1  0\n 0  0  1")
@test mytest("MatInt.jl","n=[1 2 3;4 5 6]","2×3 Matrix{Int64}:\n 1  2  3\n 4  5  6")
@test mytest("MatInt.jl","complementInt(m,n)","(complement = [0 0 1], sub = [1 2 3; 0 3 6], moduli = [1, 3])")
@test mytest("MatInt.jl","m=[1 2 7;4 5 6;7 8 9;10 11 19;5 7 12]","5×3 Matrix{Int64}:\n  1   2   7\n  4   5   6\n  7   8   9\n 10  11  19\n  5   7  12")
@test mytest("MatInt.jl","MatInt.lnullspaceInt(m)","2×5 Matrix{Int64}:\n 1  18   -9  2  -6\n 0  24  -13  3  -7")
@test mytest("MatInt.jl","mat=[1 2 7;4 5 6;7 8 9;10 11 19;5 7 12]","5×3 Matrix{Int64}:\n  1   2   7\n  4   5   6\n  7   8   9\n 10  11  19\n  5   7  12")
@test mytest("MatInt.jl","solutionmat(mat,[95,115,182])","5-element Vector{Rational{Int64}}:\n  47//4\n -17//2\n  67//4\n   0//1\n   0//1")
@test mytest("MatInt.jl","solutionmatInt(mat,[95,115,182])","5-element Vector{Int64}:\n  2285\n -5854\n  4888\n -1299\n     0")
@test mytest("MatInt.jl","r=diaconis_graham([3 0;4 1],[10,5])","(rowtrans = [-13 10; 4 -3], normal = [1 0; 0 2])")
@test mytest("MatInt.jl","r.normal==mod.(r.rowtrans*[3 0;4 1],[10,5]')","true")
end
end
