set (BINNAME test-ambition-plugin-couchdb)

include(ValaPrecompile)

SET( TAPC_VALA_PACKAGES
    ${PPKGNAME}-${PPKGVERSION}
    posix
	${APCDB_DEPS_PACKAGES}
)

vala_precompile(TAPC_VALA_C
    CouchdbTest.vala
PACKAGES
    ${TAPC_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir=${CMAKE_BINARY_DIR}/src)

set(TAPC_CFLAGS
    ${APCDB_DEPS_CFLAGS_ALL}
    -I${CMAKE_BINARY_DIR}/src
    -w
)
set(TAPC_LIB_PATHS
    ${APCDB_DEPS_LIBRARY_DIRS}
    ${CMAKE_BINARY_DIR}/src
)
link_directories(${TAPC_LIB_PATHS})
add_definitions(${TAPC_CFLAGS})

add_executable(${BINNAME} ${TAPC_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PPKGNAME}-${PPKGVERSION})
target_link_libraries(${BINNAME} ${APA_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
