using Documenter, MatInt

DocMeta.setdocmeta!(MatInt, :DocTestSetup, :(using MatInt); recursive=true)

makedocs(;
    modules=[MatInt],
    authors="Jean Michel <jean.michel@imj-prg.fr> and contributors",
    sitename="MatInt.jl",
    format=Documenter.HTML(;
        canonical="https://jmichel7.github.io/MatInt.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
    warnonly=:missing_docs,
)

deploydocs(;
    repo="github.com/jmichel7/MatInt.jl",
    devbranch="main",
)
