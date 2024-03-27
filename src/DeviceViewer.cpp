#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include "DeviceViewer.hpp"

DeviceViewer::DeviceViewer()
{
    QFile devicesFile(":/devices.json");

    if (!devicesFile.open(QIODevice::ReadOnly))
    {
        return;
    }

    QJsonDocument jsDoc;
    QJsonParseError error;
    jsDoc = QJsonDocument().fromJson(devicesFile.readAll(), &error);

    // check the json file is valid
    if (jsDoc.isNull() || jsDoc.isEmpty())
        return;

    // now fill the model with the data from json file
    for (const QJsonValue& val : jsDoc.array())
    {
        QJsonObject deviceJsonObj = val.toObject();
        QString img = QString("../img/%1").arg(deviceJsonObj.value("photo").toString());
        Device localDevice(deviceJsonObj.value("reference").toString(),
                  deviceJsonObj.value("majorVersion").toInt(),
                  deviceJsonObj.value("minorVersion").toInt(),
                  deviceJsonObj.value("description").toString(),
                  img);
        m_DevicesModel.appendDevice(localDevice);
    }
}

DevicesModel *DeviceViewer::getDevicesModel()
{
    return &m_DevicesModel;
}
