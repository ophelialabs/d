"""
Documenter.jl build script for MyDocumentation

This script builds the documentation site and can be run with:
    julia --project=docs docs/make.jl

Configuration and build process:
- Loads the package from the parent directory
- Processes Markdown sources from docs/src/
- Generates HTML documentation
- Deploys to GitHub Pages (when run in CI)
"""

using Documenter, MyDocumentation

# Define the documentation structure
makedocs(
    # Site metadata
    sitename="MyDocumentation.jl",
    authors="Your Name",
    remotes=nothing,  # Disable source links (work locally without Git)
    
    # Build options
    clean=true,
    doctest=false,  # Set to true to run doctests
    linkcheck=false,  # Set to true to validate external links
    
    # Source and build directories
    source="src",
    build="build",
    
    # Page structure - customize this to match your documentation
    pages=[
        "Home" => "index.md",
        "Guide" => [
            "Getting Started" => "guide/getting_started.md",
            "Tutorial" => "guide/tutorial.md",
            "Advanced Usage" => "guide/advanced.md",
        ],
        "API Reference" => "api/reference.md",
        "Examples" => [
            "Basic Examples" => "examples/basic.md",
            "Advanced Examples" => "examples/advanced.md",
        ],
        "Contributing" => "contributing.md",
    ],
)

# Deploy documentation to GitHub Pages
# Uncomment and customize when pushing to GitHub

deploydocs(
    repo="github.com/YOUR_USERNAME/MyDocumentation.jl",  # Change this!
    target="build",
    branch="gh-pages",
    devbranch="main",
    push_preview=true,
    # Optionally add versioning:
    # versions = ["stable" => "v^", "v#.#" => "v#.#", "devel" => "main"],
)

