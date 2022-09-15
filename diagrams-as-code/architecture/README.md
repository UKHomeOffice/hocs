# Architecture

We use Structurizr DSL (_TODO: Add link_) to define views of DECS as code (as a single `workspace.dsl` file) and we can automatically produce up-to-date diagrams that reflect reality.

The documentation (_TODO: Add link_) folder of this repo is deployed to a GitHub Pages site (_TODO: Add link_). This is static content but when the `workspace.dsl` file is updated, the static files will have become legacy. So we need to:
1. Be able to check our changes produce documents as intended.
2. Be able to promote these changes to our GitHub Pages site.

## 1. Check our changes
The recommended solution is to use Structurizr Lite (_TODO: Add link_) to preview our documents.

## 2. Promote our changes
Each view of DECS will have its own corresponding file in the documentation/architecture/diagrams/ (_TODO: Add link_) folder. These will need to be updated and committed to trigger and update of the GitHub Pages site.