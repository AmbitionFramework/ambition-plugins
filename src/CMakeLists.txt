SET( APST_VALA_FILES
	Deserializer/IDeserializer.vala
	Deserializer/JSON.vala
	Deserializer/JSONNode.vala
	ServiceThingPlugin.vala
	ServiceThing.vala
	Service.vala
	Serializer/ISerializer.vala
	Serializer/HTML.vala
	Serializer/JSON.vala
	Serializer/XML.vala
)

vala_precompile(APST_VALA_C
	${APST_VALA_FILES}
PACKAGES
	${APST_VALA_PACKAGES}
OPTIONS
	${DEFAULT_VALA_OPTIONS}
GENERATE_VAPI
	${PPKGNAME}-${PPKGVERSION}
GENERATE_HEADER
	${PPKGNAME}-${PPKGVERSION})

link_directories(${APST_LIB_PATHS})
add_definitions(${APST_DEPS_CFLAGS_ALL})

add_library(${PPKGNAME}-${PPKGVERSION} SHARED ${APST_VALA_C})
target_link_libraries(${PPKGNAME}-${PPKGVERSION} ${APST_DEPS_LIBRARIES})

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
