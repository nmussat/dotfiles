init:
	bin/init.sh

dry-run:
	bin/init.sh --dry-run

clean:
	bin/clean.sh

clean-dry-run:
	bin/clean.sh --dry-run

.PHONY: init dry-run clean clean-dry-run
.SILENT: init dry-run clean clean-dry-run
