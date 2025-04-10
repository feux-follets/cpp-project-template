# Import std modules
set(CMAKE_EXPERIMENTAL_CXX_IMPORT_STD "a9e1cf81-9932-4810-974b-6eccaf14e457")
set(CMAKE_CXX_MODULE_STD ON)

if (APPLE)
	set(SYSTEM_DIR "/opt/homebrew/opt/llvm")
elseif (UNIX)
	set(SYSTEM_DIR "/usr")
endif ()
set(SYSTEM_INCLUDE_DIR "${SYSTEM_DIR}/include")
set(SYSTEM_LIBRARY_DIR "${SYSTEM_DIR}/lib")
set(SYSTEM_SHARE_DIR "${SYSTEM_DIR}/share")
set(SYSTEM_STD_MODULE_DIR "${SYSTEM_SHARE_DIR}/libc++/v1")

if (APPLE)
	set(CMAKE_OSX_SYSROOT /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk)
	add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-nostdinc++>)
	add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-isystem${SYSTEM_INCLUDE_DIR}/c++/v1>)
	add_link_options($<$<COMPILE_LANGUAGE:CXX>:-nostdlib++>)
	add_link_options($<$<COMPILE_LANGUAGE:CXX>:-L${SYSTEM_LIBRARY_DIR}/c++>)
	add_link_options($<$<COMPILE_LANGUAGE:CXX>:-Wl,-rpath,${SYSTEM_LIBRARY_DIR}/c++>)
	add_link_options($<$<COMPILE_LANGUAGE:CXX>:-lc++>)
elseif (UNIX)
	set(CMAKE_CXX_FLAGS "-stdlib=libc++")
endif ()


# Intellisense
add_library(unused_std_target STATIC)
target_sources(unused_std_target
		PRIVATE
		FILE_SET CXX_MODULES
		BASE_DIRS ${SYSTEM_STD_MODULE_DIR}
		FILES ${SYSTEM_STD_MODULE_DIR}/std.cppm ${SYSTEM_STD_MODULE_DIR}/std.compat.cppm)