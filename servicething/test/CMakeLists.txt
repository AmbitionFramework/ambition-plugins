set (BINNAME test-${PPKGNAME})

include(ValaPrecompile)

SET( TAPST_VALA_PACKAGES
    ${PPKGNAME}-${PPKGVERSION}
    posix
	${APST_DEPS_PACKAGES}
)

vala_precompile(TAPST_VALA_C
    DeserializeJsonTest.vala
    ServiceThingTest.vala
    SerializeJsonTest.vala
    TestClasses.vala
PACKAGES
    ${TAPST_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir ${CMAKE_BINARY_DIR}/src)

set(TAPST_CFLAGS
    -I${CMAKE_BINARY_DIR}/src
    ${APST_DEPS_CFLAGS_ALL}
)
set(TAPST_LIB_PATHS
    ${APST_DEPS_LIBRARY_DIRS}
    ${CMAKE_BINARY_DIR}/src
)
link_directories(${TAPST_LIB_PATHS})
add_definitions(${TAPST_CFLAGS})

add_executable(${BINNAME} ${TAPST_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PKGNAME}-${PKGVERSION})
target_link_libraries(${BINNAME} ${APST_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
