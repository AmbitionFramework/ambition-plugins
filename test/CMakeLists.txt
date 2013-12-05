set (BINNAME test-ambition-plugin-twitterbootstrap)

include(ValaPrecompile)

SET( TAPBS_VALA_PACKAGES
    ${PPKGNAME}-${PPKGVERSION}
    ${APTBS_DEPS_PACKAGES}
	posix
)

vala_precompile(TAPBS_VALA_C
    TwitterBootstrapTest.vala
	TBTextInputTest.vala
    TBButtonTest.vala
PACKAGES
    ${TAPBS_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir ${CMAKE_BINARY_DIR}/src
)
set(TAPBS_CFLAGS
    ${APTBS_DEPS_CFLAGS_ALL}
    -I${CMAKE_BINARY_DIR}/src
    -w
)
set(TAPBS_LIB_PATHS
    ${APTBS_LIB_PATHS}
    ${CMAKE_BINARY_DIR}/src
)
add_definitions(${TAPBS_CFLAGS})

add_executable(${BINNAME} ${TAPBS_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PPKGNAME}-${PPKGVERSION})
target_link_libraries(${BINNAME} ${TAPBS_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
