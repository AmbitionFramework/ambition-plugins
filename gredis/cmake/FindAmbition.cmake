##
# Find module for Ambition
#
# Call the module using "find_package(Ambition) from within your CMakeLists.txt.
#
#  AMBITION_VERSION Version number of Ambition
#  AMBITION_LIBNAME Library name of found Ambition (ex. ambition-0.2)
##

find_library(AMBITION_LIB ambition-0.2)
if(AMBITION_LIB)
  SET(AMBITION_VERSION "0.2")
else()
  find_library(AMBITION_LIB ambition-0.1)
    if(AMBITION_LIB)
      SET(AMBITION_VERSION "0.1")
    endif()
endif()

if(AMBITION_VERSION)
  SET(AMBITION_LIBNAME "ambition-${AMBITION_VERSION}")
endif()