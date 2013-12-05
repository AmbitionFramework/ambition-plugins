SET( AES_VALA_FILES
	SCGI.vala
	SCGIPlugin.vala
	SCGIUtility.vala
)
vala_precompile(AES_VALA_C
	${AES_VALA_FILES}
PACKAGES
    ${AES_VALA_PACKAGES}
OPTIONS
	--thread
    --vapidir=${CMAKE_SOURCE_DIR}/vapi
    --vapidir=${CMAKE_BINARY_DIR}/src/libambition
	--enable-experimental
GENERATE_VAPI
	${PPKGNAME}-${PPKGVERSION}
GENERATE_HEADER
	${PPKGNAME}-${PPKGVERSION}
)

link_directories(${AES_LIB_PATHS})
add_definitions(${AES_DEPS_CFLAGS_ALL})

add_library(${PPKGNAME}-${PPKGVERSION} SHARED ${AES_VALA_C})
target_link_libraries(${PPKGNAME}-${PPKGVERSION} ${AES_DEPS_LIBRARIES})

install (
	FILES ${CMAKE_CURRENT_BINARY_DIR}/${PPKGNAME}-${PPKGVERSION}.vapi ${PPKGNAME}-${PPKGVERSION}.deps
	DESTINATION ${CMAKE_INSTALL_PREFIX}/share/ambition-framework/plugins/${PLUGINNAME}-${PPKGVERSION}/
)
install (
	FILES ${CMAKE_CURRENT_BINARY_DIR}/${PPKGNAME}-${PPKGVERSION}.h
	DESTINATION ${CMAKE_INSTALL_PREFIX}/share/ambition-framework/plugins/${PLUGINNAME}-${PPKGVERSION}/
)
install (
	TARGETS ${PPKGNAME}-${PPKGVERSION}
	DESTINATION ${CMAKE_INSTALL_PREFIX}/share/ambition-framework/plugins/${PLUGINNAME}-${PPKGVERSION}/
)
