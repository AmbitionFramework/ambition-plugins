cmake_minimum_required (VERSION 2.8)
cmake_policy(VERSION 2.8)
project(ambition-plugin-twitterbootstrap)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake )
enable_testing()

find_package(Vala REQUIRED)
include(ValaVersion)
include(ValaPrecompile)
ensure_vala_version("0.16.0" MINIMUM)

find_package(Ambition REQUIRED)

IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
	SET(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "install prefix" FORCE)
ENDIF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

IF(LIB_INSTALL_DIR)
ELSE()
SET(LIB_INSTALL_DIR lib)
ENDIF()

set (PPKGNAME ambition-plugin-twitterbootstrap)
set (PLUGINNAME TwitterBootstrap)
set (PPKGVERSION 0.1.1)
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (DOLLAR "$")

SET( APTBS_DEPS_PACKAGES
	glib-2.0
	gee-0.8
	gmodule-2.0
	${AMBITION_LIBNAME}
)

SET( APTBS_VALA_PACKAGES
	${APTBS_DEPS_PACKAGES}
	posix
)

find_package(PkgConfig)
pkg_check_modules(APTBS_DEPS REQUIRED ${APTBS_DEPS_PACKAGES} gthread-2.0)
SET( CMAKE_BUILD_TYPE Debug )
SET( APTBS_DEPS_CFLAGS_ALL
	${APTBS_DEPS_CFLAGS}
	${APTBS_DEPS_CFLAGS_OTHER}
)
set(APTBS_LIB_PATHS
    ${APTBS_DEPS_LIBRARY_DIRS}
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
