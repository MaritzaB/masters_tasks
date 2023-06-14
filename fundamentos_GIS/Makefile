reports: \
	reports/proyecto_final.pdf

.PHONY: \
	reports \
	clean

define renderLatex
    cd $(<D) && pdflatex $(<F)
	cd $(<D) && pdflatex $(<F)
endef

reports/proyecto_final.pdf: reports/proyecto_final.tex
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
