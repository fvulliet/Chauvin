#include <QObject>
#include <QAbstractListModel>
#include <QFile>

#include "DevicesModel.hpp"

/**
 * @brief The DeviceViewer class
 * this class deals with the devices model
 * not so useful so far.. might be removed later
 */
class DeviceViewer : public QObject
{
    Q_OBJECT

public:
    /**
     * @brief DeviceViewer
     * ctor
     */
    DeviceViewer();

    DeviceViewer(QString url);

    bool fill(QString url) const;

    /**
     * @brief getDevicesModel
     * @return the devices model
     */
    Q_INVOKABLE DevicesModel* getDevicesModel();    

private:
    DevicesModel m_DevicesModel; /**< the device model, to be used in QML */
};
