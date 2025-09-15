MAIN := main.pdf
HW_SRC := $(wildcard HW/*.typ)
HW_PDF := $(HW_SRC:.typ=.pdf)
CHAPS := $(wildcard chap*.typ)

all: $(MAIN) $(HW_PDF)

$(MAIN): main.typ $(CHAPS)
	typst compile main.typ

HW/%.pdf: HW/%.typ
	typst compile $<

clean:
	rm -f $(MAIN) $(HW_PDF)
