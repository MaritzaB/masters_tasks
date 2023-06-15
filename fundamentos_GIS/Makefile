reports: \
	reports/main.pdf

.PHONY: \
	reports \
	clean

define renderLatex
    cd $(<D) && pdflatex $(<F)
	cd $(<D) && bibtex $(subst .tex,,$(<F))
	cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)
endef

reports/main.pdf: reports/main.tex
	$(renderLatex)


clean:
	rm --force reports/*.aux
	rm --force reports/*.bbl
	rm --force reports/*.blg
	rm --force reports/*.log
	rm --force reports/*.out
	rm --force reports/*.pdf
	rm --force reports/*.toc
	rm --force reports/*.pdfsync
