LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

common_SRC_FILES :=  \
	ixml/src/node.c \
	ixml/src/ixmlmembuf.c \
	ixml/src/ixml.c \
	ixml/src/nodeList.c \
	ixml/src/document.c \
	ixml/src/ixmldebug.c \
	ixml/src/attr.c \
	ixml/src/ixmlparser.c \
	ixml/src/namedNodeMap.c \
	ixml/src/element.c \
	threadutil/src/FreeList.c \
	threadutil/src/ThreadPool.c \
	threadutil/src/LinkedList.c \
	threadutil/src/TimerThread.c \
	upnp/src/uuid/md5.c \
	upnp/src/uuid/sysdep.c \
	upnp/src/uuid/uuid.c \
	upnp/src/genlib/util/util.c \
	upnp/src/genlib/util/strintmap.c \
	upnp/src/genlib/util/upnp_timeout.c \
	upnp/src/genlib/util/membuffer.c \
	upnp/src/genlib/service_table/service_table.c \
	upnp/src/genlib/client_table/client_table.c \
	upnp/src/genlib/net/sock.c \
	upnp/src/genlib/net/http/statcodes.c \
	upnp/src/genlib/net/http/httpreadwrite.c \
	upnp/src/genlib/net/http/webserver.c \
	upnp/src/genlib/net/http/parsetools.c \
	upnp/src/genlib/net/http/httpparser.c \
	upnp/src/genlib/net/uri/uri.c \
	upnp/src/genlib/miniserver/miniserver.c \
	upnp/src/gena/gena_device.c \
	upnp/src/gena/gena_ctrlpt.c \
	upnp/src/gena/gena_callback2.c \
	upnp/src/soap/soap_ctrlpt.c \
	upnp/src/soap/soap_common.c \
	upnp/src/soap/soap_device.c \
	upnp/src/api/upnpdebug.c \
	upnp/src/api/upnpapi.c \
	upnp/src/api/UpnpString.c \
	upnp/src/api/upnptools.c \
	upnp/src/urlconfig/urlconfig.c \
	upnp/src/ssdp/ssdp_device.c \
	upnp/src/ssdp/ssdp_ctrlpt.c \
	upnp/src/ssdp/ssdp_server.c \
	upnp/src/inet_pton.c \


common_C_INCLUDES := \
	$(LOCAL_PATH)/ixml/src/inc \
	$(LOCAL_PATH)/ixml/inc \
	$(LOCAL_PATH)/threadutil/inc \
	$(LOCAL_PATH)/upnp/inc \
	$(LOCAL_PATH)/upnp/src/inc \

# Shared or static library for target
# ========================================================
include $(CLEAR_VARS)
LOCAL_MODULE := libupnp
LOCAL_SRC_FILES := $(common_SRC_FILES)
LOCAL_CFLAGS += -Wno-format -DHAVE_CONFIG_H  -D_THREAD_SAFE #-DDEBUG
LOCAL_C_INCLUDES += $(common_C_INCLUDES)
LOCAL_MODULE:= libupnp
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

# test
# ========================================================
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	upnp/sample/common/sample_util.c \
	upnp/sample/common/tv_ctrlpt.c \
	upnp/sample/common/tv_device.c \
	upnp/sample/linux/tv_combo_main.c

LOCAL_CFLAGS += -Wno-format -DHAVE_CONFIG_H  -D_THREAD_SAFE #-DDEBUG
LOCAL_C_INCLUDES += $(common_C_INCLUDES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/upnp/sample/common/

LOCAL_MODULE := tv_combo.bin
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libupnp
LOCAL_SHARED_LIBRARIES := liblog
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	upnp/sample/common/sample_util.c \
	upnp/sample/common/tv_ctrlpt.c \
	upnp/sample/linux/tv_ctrlpt_main.c

LOCAL_CFLAGS += -Wno-format -DHAVE_CONFIG_H  -D_THREAD_SAFE #-DDEBUG
LOCAL_C_INCLUDES += $(common_C_INCLUDES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/upnp/sample/common/

LOCAL_MODULE := tv_ctrlpt.bin
LOCAL_STATIC_LIBRARIES := libupnp
LOCAL_SHARED_LIBRARIES := liblog
include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	upnp/sample/common/sample_util.c \
	upnp/sample/common/tv_device.c \
	upnp/sample//linux/tv_device_main.c

LOCAL_CFLAGS += -Wno-format -DHAVE_CONFIG_H  -D_THREAD_SAFE #-DDEBUG
LOCAL_C_INCLUDES += $(common_C_INCLUDES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/upnp/sample/common/

LOCAL_MODULE := tv_device.bin
LOCAL_STATIC_LIBRARIES := libupnp
LOCAL_SHARED_LIBRARIES := liblog
include $(BUILD_EXECUTABLE)
