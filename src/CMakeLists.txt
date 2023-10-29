project(main)

file(GLOB_RECURSE SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR} *.cpp *.h)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(${PROJECT_NAME} PRIVATE fmt::fmt)
