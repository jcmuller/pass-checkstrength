PREFIX ?= /usr
DESTDIR ?=
LIBDIR ?= $(PREFIX)/lib
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions
MANDIR ?= $(PREFIX)/share/man

all:
	@echo "pass-checkstrength is a shell script and does not need compilation, it can be simply executed."
	@echo ""
	@echo "To install it try \"make install\" instead."
	@echo
	@echo "To run pass checkstrength one needs to have some tools installed on the system:"
	@echo "     password store"
	@echo "     libcrack2"

install:
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -v -m 0644 man/pass-checkstrength.1 "$(DESTDIR)$(MANDIR)/man1/pass-checkstrength.1"
	@install -v -d "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/"
	@install -v -m0755 src/checkstrength.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/checkstrength.bash"
	@install -v -d "$(DESTDIR)$(BASHCOMPDIR)/"
	@echo
	@echo "pass-checkstrength is installed succesfully"
	@echo

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/checkstrength.bash" \
		"$(DESTDIR)$(MANDIR)/man1/pass-checkstrength.1" \

lint:
	shellcheck -s bash src/checkstrength.bash

.PHONY: install uninstall lint
