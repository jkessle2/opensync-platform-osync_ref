# Copyright (c) 2015, Plume Design Inc. All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#    1. Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#    2. Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#    3. Neither the name of the Plume Design Inc. nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL Plume Design Inc. BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

OS_TARGETS += OSYNC_REF

ifeq ($(TARGET), OSYNC_REF)
ARCH = osync_ref
PLATFORM := osync_ref
PLATFORM_DIR := platform/$(PLATFORM)
ARCH_MK := $(PLATFORM_DIR)/build/$(ARCH).mk


KCONFIGTARGET?= $(PLATFORM_DIR)/kconfig/targets/$(TARGET)

TARGET_MAKEFILE = $(PLATFORM_DIR)/Makefile

ROOTFS_SOURCE_DIRS += $(PLATFORM_DIR)/rootfs

OSYNCETCDIR=$(WORKDIR)/rootfs/usr/plume/etc
ROOTETCDIR=$(WORKDIR)/rootfs/etc
TOOLSDIR=$(WORKDIR)/rootfs/usr/plume/tools

PKG_ENV = $(VERSION_ENV) WORKDIR=$(WORKDIR) BINDIR=$(BINDIR) LIBDIR=$(LIBDIR) OSYNCETCDIR=$(OSYNCETCDIR) ROOTETCDIR=$(ROOTETCDIR) TOOLSDIR=$(TOOLSDIR) V=$(V)

.PHONY: deb-package
deb-package: all rootfs
	$(Q) cp -r $(PLATFORM_DIR)/rootfs/etc $(WORKDIR)/rootfs
	$(info Make deb paket)
	$(Q) $(PKG_ENV) $(PLATFORM_DIR)/pkg-create
	
endif #OSYNC_REF

