.PHONY: diagrams status

diagrams:
	./scripts/render_diagrams.sh

status:
	@echo "MSX-NG architecture/specification repository"
	@echo "Reference board: Tang Console 138K"
	@echo "Next milestone: M1 - clock + DDR bring-up"
