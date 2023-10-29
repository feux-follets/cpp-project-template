project(main)
add_executable(${PROJECT_NAME})
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_sources(${PROJECT_NAME}
		PRIVATE
		FILE_SET CXX_MODULES
		BASE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}
		FILES
		Template.cppm

		PRIVATE
		main.cpp
)

target_link_libraries(${PROJECT_NAME} fmt::fmt)