##############################################
# OpenWrt Makefile for socketman 
# This example is provided along with a guide
# for building OpenWrt packages using the
# Creator Ci40 OpenWrt SDK
##############################################

include $(TOPDIR)/rules.mk

# Name and release number of this package
PKG_NAME:=socketman
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/socketman
	SECTION:=cucumber
	CATEGORY:=Cucumber Tony
	DEPENDS:=+zlib +libjson-c +curl +libcurl +libopenssl +libpthread +libmosquitto +@LIBCURL_OPENSSL +libc +libnl
	TITLE:=SocketMan communication package for Cucumber Tony
endef

define Package/PKG_NAME/description
	Simple OpenWrt app
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/socketman/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/socketman $(1)/bin/
endef

$(eval $(call BuildPackage,socketman))
