set (BINNAME test-ambition-plugin-textcaptcha)

include(ValaPrecompile)

SET( TAHT_VALA_PACKAGES
	${AHT_DEPS_PACKAGES}
    ${PPKGNAME}-${PPKGVERSION}
)

vala_precompile(TAHT_VALA_C
	TextCaptchaTest.vala
PACKAGES
    ${TAHT_VALA_PACKAGES}
OPTIONS
    ${DEFAULT_VALA_OPTIONS}
    --vapidir ${CMAKE_BINARY_DIR}/src)

set(TAHT_CFLAGS
    ${AHT_DEPS_CFLAGS_ALL}
    -I${CMAKE_BINARY_DIR}/src
    -w
)
set(TAHT_LIB_PATHS
    ${AHT_LIB_PATHS}
    ${CMAKE_BINARY_DIR}/src
)
add_definitions(${TAHT_CFLAGS})

add_executable(${BINNAME} ${TAHT_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PPKGNAME}-${PPKGVERSION})
target_link_libraries(${BINNAME} ${AHT_DEPS_LIBRARIES} gthread-2.0 ${PPKGNAME}-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
set(ENV{DYLD_LIBRARY_PATH} "..:$ENV{DYLD_LIBRARY_PATH}")
