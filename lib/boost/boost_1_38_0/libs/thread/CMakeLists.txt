#----------------------------------------------------------------------------
# This file was automatically generated from the original CMakeLists.txt file
# Add a variable to hold the headers for the library
set (lib_headers
    thread.hpp
    thread
)

# Add a library target to the build system
boost_library_project(
  thread
  SRCDIRS  src 
  TESTDIRS  test
  HEADERS ${lib_headers}
  #  DOCDIRS 
  #  DESCRIPTION 
  MODULARIZED 
  #  AUTHORS 
  #  MAINTAINERS 
)


