using Pkg

Pkg.develop(PackageSpec(path=pwd()))
Pkg.instantiate()

using Documenter, Indexes

makedocs(
    format = Documenter.HTML(
        edit_branch = "develop"
    ),
    modules = [Indexes],
    sitename = "Indexes.jl",
    pages = [
        "Home" => "index.md",
        "API Reference" => "lib/public.md"
    ],
    authors = replace(join(Pkg.TOML.parsefile("Project.toml")["authors"], ", "), r" <.*?>" => "" ) * ", The BioJulia Organisation, and other contributors."
)
deploydocs(
    repo = "github.com/BioJulia/Indexes.jl.git",
    devbranch = "develop",
    push_preview = true
)
