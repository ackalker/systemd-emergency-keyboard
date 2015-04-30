UNITSDIR=usr/lib/systemd/system

all:

install:
	$(call install-drop-in,emergency.service,keyboard.conf,25)

.PHONY: all install

# Install a drop-in snippet for a systemd unit file
#   $1: name of unit file
#   $2: name of drop-in snippet
#   $3: priority
define install-drop-in
	install -Dm644 "drop-ins/$2" "$(DESTDIR)/$(UNITSDIR)/$1.d/$3-$2"
endef
