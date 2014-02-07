SET( APTBS_VALA_FILES
	TwitterBootstrapPlugin.vala
	Form/TBButton.vala
	Form/TBCheckboxGroupInput.vala
	Form/TBGroupInput.vala
	Form/TBPasswordInput.vala
	Form/TBRadioGroupInput.vala
	Form/TBResetButton.vala
	Form/TBSelectGroupInput.vala
	Form/TBSubmitButton.vala
	Form/TBTextarea.vala
	Form/TBTextInput.vala
)

vala_precompile(APTBS_VALA_C
	${APTBS_VALA_FILES}
PACKAGES
    ${APTBS_VALA_PACKAGES}
OPTIONS
	${DEFAULT_VALA_OPTIONS}
GENERATE_VAPI
	${PPKGNAME}-${PPKGVERSION}
GENERATE_HEADER
	${PPKGNAME}-${PPKGVERSION})

link_directories(${APTBS_LIB_PATHS})
add_definitions(${APTBS_DEPS_CFLAGS_ALL})

add_library(${PPKGNAME}-${PPKGVERSION} SHARED ${APTBS_VALA_C})
target_link_libraries(${PPKGNAME}-${PPKGVERSION} ${APTBS_DEPS_LIBRARIES})

install (
	FILES
		${CMAKE_CURRENT_BINARY_DIR}/${PPKGNAME}-${PPKGVERSION}.vapi
		${PPKGNAME}-${PPKGVERSION}.deps
		${CMAKE_CURRENT_BINARY_DIR}/${PPKGNAME}-${PPKGVERSION}.h
	DESTINATION ${CMAKE_INSTALL_PREFIX}
)
install (
	TARGETS ${PPKGNAME}-${PPKGVERSION}
	DESTINATION ${CMAKE_INSTALL_PREFIX}
)
