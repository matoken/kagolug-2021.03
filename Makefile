SOURCE=slide/sayaka.adoc
BASE=$(basename $(SOURCE))
HTML=$(BASE).html
PDF=$(BASE).pdf

#.PHONY: all

all: $(HTML) $(PDF)

$(HTML): $(SOURCE)
	asciidoctor-revealjs-linux $(SOURCE)

$(PDF): $(HTML)
	sleep 5
	chromium --user-data-dir=`mktemp -d` --headless --disable-gpu --print-to-pdf=./$(PDF) file://`pwd`/$(HTML)?print-pdf
	gpg --detach-sign ./$(PDF)

clean:
	rm -f $(PDF) $(HTML)

