# -------- Cross-platform helpers --------
ifeq ($(OS),Windows_NT)
  define MKDIR_P
    powershell -NoProfile -Command "New-Item -ItemType Directory -Force '$(1)' | Out-Null"
  endef
  define RM_RF
    powershell -NoProfile -Command "if (Test-Path '$(1)') { Remove-Item -Recurse -Force '$(1)' }"
  endef
else
  define MKDIR_P
    mkdir -p '$(1)'
  endef
  define RM_RF
    rm -rf '$(1)'
  endef
endif
# ----------------------------------------

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
	$(call RM_RF,$(MAIN) $(HW_PDF))