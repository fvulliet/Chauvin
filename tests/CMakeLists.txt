include_directories(
    ${CMAKE_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_BINARY_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    )

set(test_SRCS
    test_Device.hpp test_Device.cpp
)

add_executable(test_all ${test_SRCS})
target_link_libraries(test_all
    libChauvinCI
    Qt5::Core
    Qt5::Widgets
)

add_test(test_all ${CMAKE_CURRENT_BINARY_DIR}/test_all)


