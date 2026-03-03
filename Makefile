init:
	bin/init.sh

dry-run:
	bin/init.sh --dry-run

.PHONY: init dry-run
.SILENT: init dry-run
