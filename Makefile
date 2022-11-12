reports: \
	reports/pert_examples.pdf

.PHONY: \
	all \
	clean \
	format \
	tests

define renderLatex
    cd $(<D) && pdflatex $(<F)
	cd $(<D) && bibtex $(subst .tex,,$(<F))
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)
endef

define renderPresentation
    cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)
endef

define lint
	pylint \
        --disable=missing-class-docstring \
        --disable=missing-function-docstring \
        --disable=missing-module-docstring \
		--function-naming-style=camelCase \
        ${1}
endef

reports/ethics_software_engineer.pdf: reports/ethics_software_engineer.tex
	$(renderPresentation)

reports/pert_examples.pdf:	reports/pert_examples.tex
	$(renderPresentation)

clean:
	rm --force --recursive reports/pythontex*
	rm --force reports/*.aux
	rm --force reports/*.bbl
	rm --force reports/*.blg
	rm --force reports/*.log
	rm --force reports/*.out
	rm --force reports/*.pdf
	rm --force reports/*.toc
	rm --force reports/*.pytxcode
	rm --force slides/*.aux
	rm --force slides/*.log
	rm --force slides/*.nav
	rm --force slides/*.out
	rm --force slides/*.pdf
	rm --force slides/*.snm
	rm --force slides/*.toc


format:
	black --line-length 80 src/*.py

linter:
	$(call lint, src)
	$(call lint, tests)

tests:
	pytest --verbose tests/