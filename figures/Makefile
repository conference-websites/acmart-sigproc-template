GRAFFLE_EXPORT = osascript ../.build/graffle2pdf.scr
PPTX_EXPORT = osascript ../.build/pptx-to-pdf.scr
DOCX_EXPORT = osascript ../.build/docx-to-pdf.scr
PDFCROP = pdfcrop

.PHONY: images

IMAGE_FILES_GRAFFLE=$(shell find . -name '*.graffle')
IMAGE_FILES_PPTX=$(shell find . -name '*.pptx')
IMAGE_FILES_DOCX=$(shell find . -name '*.docx')

images: $(IMAGE_FILES_GRAFFLE:graffle=pdf) $(IMAGE_FILES_PPTX:pptx=pdf) $(IMAGE_FILES_DOCX:docx=pdf)

%.pdf: %.graffle
	${GRAFFLE_EXPORT} $< $@
	${PDFCROP} $@ $@

%.pdf: %.pptx
	${PPTX_EXPORT} $< $@
	${PDFCROP} $@ $@

%.pdf: %.docx
	${DOCX_EXPORT} $< $@
	${PDFCROP} $@ $@

clean:
	rm -f $(IMAGE_FILES:graffle=pdf) $(IMAGE_FILES_PPTX:pptx=pdf) $(IMAGE_FILES_DOCX:docx=pdf)
