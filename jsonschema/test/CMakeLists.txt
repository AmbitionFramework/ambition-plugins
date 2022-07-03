set (BINNAME test-${PPKGNAME})

include(ValaPrecompile)

SET( TAPJS_VALA_PACKAGES
    ${PPKGNAME}-${PPKGVERSION}
    posix
	${APJS_DEPS_PACKAGES}
)

vala_precompile(TAPJS_VALA_C
    AbstractTestCase.vala
    TestRunner.vala
    JSONSchemaPlugin.test.vala
PACKAGES
    ${TAPJS_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir ${CMAKE_BINARY_DIR}/src)

set(TAPJS_CFLAGS
    -I${CMAKE_BINARY_DIR}/src
    ${APJS_DEPS_CFLAGS_ALL}
)
set(TAPJS_LIB_PATHS
    ${APJS_DEPS_LIBRARY_DIRS}
    ${CMAKE_BINARY_DIR}/src
)
link_directories(${TAPJS_LIB_PATHS})
add_definitions(${TAPJS_CFLAGS})

add_executable(${BINNAME} ${TAPJS_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PPKGNAME}-${PPKGVERSION})
target_link_libraries(${BINNAME} ${APJS_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
