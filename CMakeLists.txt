cmake_minimum_required (VERSION 2.8)
cmake_policy(VERSION 2.8)
project(ambition-engine-scgi)
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

set (PPKGNAME ambition-engine-scgi)
set (PLUGINNAME SCGI)
set (PPKGVERSION 0.1.0)
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (DOLLAR "$")

SET( AES_DEPS_PACKAGES
	glib-2.0
	gee-0.8
	gmodule-2.0
	${AMBITION_LIBNAME}
	libgscgi-1.0
)

SET( AES_VALA_PACKAGES
	${AES_DEPS_PACKAGES}
	posix
)

find_package(PkgConfig)
pkg_check_modules(AES_DEPS REQUIRED ${AES_DEPS_PACKAGES})
SET( CMAKE_BUILD_TYPE Debug )
SET( AES_DEPS_CFLAGS_ALL
	${AES_DEPS_CFLAGS}
	${AES_DEPS_CFLAGS_OTHER}
	-DGETTEXT_PACKAGE=ambition
)
set(AES_LIB_PATHS
    ${AES_DEPS_LIBRARY_DIRS}
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

file(
	COPY ${CMAKE_SOURCE_DIR}/share/scaffold-engine-scgi
	DESTINATION ${CMAKE_BINARY_DIR}/share/scaffold-engine-scgi
)
install(
	DIRECTORY ${CMAKE_BINARY_DIR}/share/scaffold-engine-scgi
	DESTINATION ${CMAKE_INSTALL_PREFIX}/share
)
install (
	FILES manifest.json documentation.md
	DESTINATION ${CMAKE_INSTALL_PREFIX}
)
