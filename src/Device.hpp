#ifndef __DEVICE_H__
#define __DEVICE_H__

#include <QObject>
#include <QString>

/**
 * @brief The Device class
 * this class represents a device, with ref, version, description..
*/
class Device : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ref READ ref WRITE setRef NOTIFY refChanged)
    Q_PROPERTY(int majorVersion READ majorVersion WRITE setMajorVersion NOTIFY majorVersionChanged)
    Q_PROPERTY(int minorVersion READ minorVersion WRITE setMinorVersion NOTIFY minorVersionChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(QString photo READ photo WRITE setPhoto NOTIFY photoChanged)

public:
    /**
     * @brief Device
     * default ctor
     */
    Device();

    /**
     * @brief Device
     * ctor with all params
     */
    Device(const QString& ref, int maj, int min, const QString& desc, const QString& photo);

    /**
     * @brief Device
     * copy ctor
     * @param other
     */
    Device(const Device &other);

    ~Device();

    // getters and setters
    QString ref() const;
    void setRef(QString value);

    int majorVersion() const;
    void setMajorVersion(int value);

    int minorVersion() const;
    void setMinorVersion(int value);

    QString description() const;
    void setDescription(const QString& value);

    QString photo() const;
    void setPhoto(const QString& value);

signals:
    void refChanged();
    void majorVersionChanged();
    void minorVersionChanged();
    void descriptionChanged();
    void photoChanged();

private:
    QString m_ref; /**< the device reference */
    int m_majorVersion; /**< the device maj version */
    int m_minorVersion; /**< another min version */
    QString m_description; /**< the device description */
    QString m_photo; /**< the device photo's path */
};

#endif /* __DEVICE_H__ */
