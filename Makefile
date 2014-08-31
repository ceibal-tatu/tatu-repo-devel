VENDOR=tatu
LINTIAN_DIR=$(DESTDIR)/usr/share/lintian
PROFILE_DIR=$(LINTIAN_DIR)/profiles/$(VENDOR)
VENDOR_DATA_DIR=$(LINTIAN_DIR)/vendors/$(VENDOR)/main/data

all:

install: all
	install -d $(PROFILE_DIR)
	install -o root -g root -m 644 main.profile $(PROFILE_DIR)/main.profile
	install -d $(VENDOR_DATA_DIR)/changes-file/
	install -o root -g root -m 644 known-dists $(VENDOR_DATA_DIR)/changes-file/known-dists
