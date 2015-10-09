talksdir := ./talks

talks := $(wildcard $(talksdir)/*.md)
talks_pdf := $(patsubst $(talksdir)/%.md,$(talksdir)/%.pdf,$(talks))

talks/%.pdf: talks/%.md
	pandoc $< \
		-t beamer \
		--slide-level 2 \
		--highlight-style=zenburn \
		-H src/preamble-slides.tex \
		-o $@

all: $(talks_pdf)

.PHONY: all
