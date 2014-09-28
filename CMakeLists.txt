cmake_minimum_required (VERSION 2.8)
cmake_policy(VERSION 2.8)
project(ambition-plugin-jsonschema)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake )
enable_testing()

find_package(Vala REQUIRED)
include(ValaVersion)
include(ValaPrecompile)
ensure_vala_version("0.16.0" MINIMUM)

IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
	SET(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "install prefix" FORCE)
ENDIF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

IF(LIB_INSTALL_DIR)
ELSE()
SET(LIB_INSTALL_DIR lib)
ENDIF()

set (PPKGNAME ambition-plugin-jsonschema)
set (PLUGINNAME ServiceThing)
set (PPKGVERSION 0.1.0)
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (DOLLAR "$")

SET( APJS_DEPS_PACKAGES
	glib-2.0
	gee-0.8
	gmodule-2.0
	ambition-0.1
	json-glib-1.0
)

SET( APJS_VALA_PACKAGES
	${APJS_DEPS_PACKAGES}
	posix
)

find_package(PkgConfig)
pkg_check_modules(APJS_DEPS REQUIRED ${APJS_DEPS_PACKAGES})
SET( CMAKE_BUILD_TYPE Debug )
SET( APJS_DEPS_CFLAGS_ALL
	${APJS_DEPS_CFLAGS}
	${APJS_DEPS_CFLAGS_OTHER}
)
set(APJS_LIB_PATHS
    ${APJS_DEPS_LIBRARY_DIRS}
)

set (VAPIDIRS 
	--vapidir='${CMAKE_SOURCE_DIR}'
	--vapidir='${CMAKE_SOURCE_DIR}/vapi'
	--vapidir='${BINSOURCE}'
)
set (DEFAULT_VALA_OPTIONS
	${VAPIDIRS}
	--thread
	--enable-experimental
	--target-glib=2.32
	--debug
	-g
)

add_subdirectory (src)
add_subdirectory (test)

install (
	FILES manifest.json documentation.md
	DESTINATION ${CMAKE_INSTALL_PREFIX}
)
