# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = docs

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# %: Makefile
# 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
%: Makefile
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	rm -r docs
	mkdir docs
	mkdir docs/_images
	mkdir docs/_files
	mkdir docs/tutorials
	mkdir docs/tutorials/_files
	mkdir docs/highlight
	mkdir docs/highlight/_files
	cp .nojekyll docs
	cp CNAME docs
	cp *.png docs/_images 
	cp *.pdf docs/_files
	cp *.pdf docs/tutorials/_files
	cp *.pdf docs/highlight/_files
