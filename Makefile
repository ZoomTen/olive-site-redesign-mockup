HAMLC=haml
HAML_OPTS=
SASSC=sass
SASS_OPTS= -t compact

all: built/index.html built/download.html built/style.css built/assets

built/assets: src/assets
	cp -r src/assets built/

built/index.html: src/index.haml
	$(HAMLC) $(HAML_OPTS) src/index.haml > built/index.html

built/download.html: src/download.haml
	$(HAMLC) $(HAML_OPTS) src/download.haml > built/download.html

built/style.css: src/styles.scss
	$(SASSC) $(SASS_OPTS) src/styles.scss built/style.css

clean:
	rm -r built/*
