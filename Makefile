# gthnk-install-2017-fall
# Ian Dennis Miller

PROJECT=2017-fall-gthnk-overview

presentation:
	cd presentation && Rscript -e "library(rmarkdown); rmarkdown::render('$(PROJECT).Rmd')"
	cp presentation/$(PROJECT).html docs/index.html
	cp -r presentation/$(PROJECT)_files docs
	cp -r presentation/assets docs

tidy:
	rm -f presentation/$(PROJECT).md
	rm -f presentation/$(PROJECT).pdf
	rm -f presentation/$(PROJECT).html
	rm -rf presentation/$(PROJECT)_files
	rm -rf presentation/_bookdown_files
	rm -rf presentation/_book

open:
	open docs/index.html

clean: tidy
	rm -rf docs
	mkdir docs

release: clean presentation
	git commit -am "release"
	git push

serve:
	cd docs && python -m SimpleHTTPServer

.PHONY: presentation release open clean serve
