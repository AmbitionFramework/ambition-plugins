set (BINNAME test-ambition-plugin-couchbase)

include(ValaPrecompile)

SET( TAPCB_VALA_PACKAGES
    ${PPKGNAME}-${PPKGVERSION}
	${APCB_VALA_PACKAGES}
)

vala_precompile(TAPCB_VALA_C
    CouchbaseTest.vala
PACKAGES
    ${TAPCB_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir=${CMAKE_BINARY_DIR}/src)

set(TAPCB_CFLAGS
    ${APCB_DEPS_CFLAGS_ALL}
    -I${CMAKE_BINARY_DIR}/src
    -w
)
set(TAPCB_LIB_PATHS
    ${APCB_DEPS_LIBRARY_DIRS}
    ${CMAKE_BINARY_DIR}/src
)
link_directories(${TAPCB_LIB_PATHS})
add_definitions(${TAPCB_CFLAGS})

add_executable(${BINNAME} ${TAPCB_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PKGNAME}-${PKGVERSION})
target_link_libraries(${BINNAME} ${APA_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
