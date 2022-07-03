set (BINNAME test-ambition-plugin-gredis)

include(ValaPrecompile)

SET( TAPGR_VALA_PACKAGES
    ${PPKGNAME}-${PPKGVERSION}
	${APGR_VALA_PACKAGES}
)

vala_precompile(TAPGR_VALA_C
    GRedisTest.vala
PACKAGES
    ${TAPGR_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir=${CMAKE_BINARY_DIR}/src)

set(TAPGR_CFLAGS
    ${APGR_DEPS_CFLAGS_ALL}
    -I${CMAKE_BINARY_DIR}/src
    -w
)
set(TAPGR_LIB_PATHS
    ${APGR_DEPS_LIBRARY_DIRS}
    ${CMAKE_BINARY_DIR}/src
)
link_directories(${TAPGR_LIB_PATHS})
add_definitions(${TAPGR_CFLAGS})

add_executable(${BINNAME} ${TAPGR_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PPKGNAME}-${PPKGVERSION})
target_link_libraries(${BINNAME} ${APA_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
