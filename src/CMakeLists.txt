find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Gui Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Quick)

add_executable(chauvinCI)

target_sources(chauvinCI PRIVATE
    main.cpp
    DeviceViewer.cpp DeviceViewer.hpp
    DevicesModel.cpp DevicesModel.hpp
    Device.cpp Device.hpp
    qml.qrc
)

target_link_libraries(chauvinCI PRIVATE
    Qt::Gui
    Qt::Quick
)
