prefix=/usr

datarootdir=$(prefix)/share
docdir=$(datarootdir)/doc/git-tools
# files that need mode 755
EXEC_FILES=git-tools

# files that need mode 644
SCRIPT_FILES=git-browse 
SCRIPT_FILES+=git-wip

# Hook files
HOOK_FILES=$(wildcard hooks/*)

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	echo $(SCRIPT_FILES)
	install -d -m 0755 $(prefix)/bin
	install -d -m 0755 $(docdir)/hooks
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0755 $(SCRIPT_FILES) $(prefix)/bin
	# install -m 0644 $(HOOK_FILES) $(docdir)/hooks

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES)
	test -d $(docdir) && \
	rm -rf $(docdir)
