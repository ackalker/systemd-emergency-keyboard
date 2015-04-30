SYSTEMDDIR=usr/lib/systemd

all:

install:
	$(call install-drop-in,initrd,emergency.service,keyboard.conf,25)
	$(call install-drop-in,system,emergency.service,keyboard.conf,25)

.PHONY: all install

# Install a drop-in snippet for a systemd unit file
#   $1: name of boot phase [initrd, system]
#   $2: name of unit file
#   $3: name of drop-in snippet
#   $4: priority
define install-drop-in
	install -Dm644 "drop-ins/$3" "$(DESTDIR)/$(SYSTEMDDIR)/$1/$2.d/$4-$3"
endef
