VENDOR=tatu
LINTIAN_DIR=$(DESTDIR)/usr/share/lintian
PROFILE_DIR=$(LINTIAN_DIR)/profiles/$(VENDOR)
VENDOR_DATA_DIR=$(LINTIAN_DIR)/vendors/$(VENDOR)/main/data

all:

install: all
	install -d $(DESTDIR)/var/log/tatu-repo-devel/
	install -d $(DESTDIR)/etc/
	install -o root -g root -m 644 etc/*.conf $(DESTDIR)/etc/
	install -o root -g root -m 644 etc/pbuilder* $(DESTDIR)/etc/
	install -d $(DESTDIR)/etc/profile.d/
	install -o root -g root -m 644 etc/profile.d/* $(DESTDIR)/etc/profile.d/
	install -d $(DESTDIR)/usr/bin/
	install -o root -g root -m 755 bin/* $(DESTDIR)/usr/bin/
	install -d $(PROFILE_DIR)
	install -o root -g root -m 644 main.profile $(PROFILE_DIR)/main.profile
	install -d $(VENDOR_DATA_DIR)/changes-file/
	install -o root -g root -m 644 known-dists $(VENDOR_DATA_DIR)/changes-file/known-dists
