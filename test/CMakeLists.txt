set (BINNAME test-ambition-plugin-almanna)

include(ValaPrecompile)

SET( TAPA_VALA_PACKAGES
    ambition-plugin-almanna-${PPKGVERSION}
    posix
	${APA_DEPS_PACKAGES}
)

vala_precompile(TAPA_VALA_C
    UserEntity.vala
	AlmannaTest.vala
PACKAGES
    ${TAPA_VALA_PACKAGES}
OPTIONS
    -g
	--thread
    --vapidir ${CMAKE_BINARY_DIR}/src
	--enable-experimental)

set(TAPA_CFLAGS
    -I${CMAKE_BINARY_DIR}/src
    ${APA_DEPS_CFLAGS_ALL}
    -w
)
set(TAPA_LIB_PATHS
    ${CORE_DEPS_LIBRARY_DIRS}
    ${APA_DEPS_LIBRARY_DIRS}
    ${CMAKE_BINARY_DIR}/src
)
link_directories(${TAPA_LIB_PATHS})
add_definitions(${TAPA_CFLAGS})

add_executable(${BINNAME} ${TAPA_VALA_C})
include_directories(${CMAKE_BINARY_DIR}/src)
add_dependencies(${BINNAME} ${PKGNAME}-${PKGVERSION})
target_link_libraries(${BINNAME} ${CORE_DEPS_LIBRARIES} ${APA_DEPS_LIBRARIES} gthread-2.0 ambition-plugin-almanna-${PPKGVERSION})
include(Tests)
add_test_executable(${BINNAME})
file(COPY ${CMAKE_SOURCE_DIR}/test/test.db DESTINATION ${CMAKE_BINARY_DIR}/test/)
set(ENV{LD_LIBRARY_PATH} "..:$ENV{LD_LIBRARY_PATH}")
