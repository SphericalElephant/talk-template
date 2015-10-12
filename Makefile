talksdir := ./talks

talks := $(wildcard $(talksdir)/*.md)
talks_pdf := $(patsubst $(talksdir)/%.md,$(talksdir)/%.pdf,$(talks))
talks_handouts_pdf := $(patsubst $(talksdir)/%.md,$(talksdir)/%-handout.pdf,$(talks))

talks/%.pdf: talks/%.md
	pandoc $< \
		-t beamer \
		--slide-level 2 \
		--highlight-style=zenburn \
		-H src/preamble-slides.tex \
		-o $@

talks/%-handout.pdf: talks/%.md
	pandoc $< \
		-t beamer \
		--slide-level 2 \
		-H src/preamble-handouts.tex \
		-o $@

all: $(talks_pdf) $(talks_handouts_pdf)

clean:
	rm $(talks_pdf)
	rm $(talks_handouts_pdf)

.PHONY: all
