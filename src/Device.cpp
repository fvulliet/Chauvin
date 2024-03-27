#include "Device.hpp"


Device::Device() :
    m_majorVersion(1),
    m_minorVersion(0)
{
}

Device::Device(const QString &ref, int maj, int min, const QString &desc, const QString &photo) :
    m_ref(ref),
    m_majorVersion(maj),
    m_minorVersion(min),
    m_description(desc),
    m_photo(photo)
{
}

Device::Device(const Device &other) :
    m_ref(other.m_ref),
    m_majorVersion(other.m_majorVersion),
    m_minorVersion(other.m_minorVersion),
    m_description(other.m_description),
    m_photo(other.m_photo)
{
}

Device::~Device()
{
}

QString Device::ref() const
{
    return m_ref;
}

void Device::setRef(QString value)
{
    if (value == m_ref)
        return;

    m_ref = value;
    emit refChanged();
}

int Device::majorVersion() const
{
    return m_majorVersion;
}

void Device::setMajorVersion(int value)
{
    if (value == m_majorVersion)
        return;

    m_majorVersion = value;
    emit majorVersionChanged();
}

int Device::minorVersion() const
{
    return m_minorVersion;
}

void Device::setMinorVersion(int value)
{
    if (value == m_minorVersion)
        return;

    m_minorVersion = value;
    emit minorVersionChanged();
}

QString Device::description() const
{
    return m_description;
}

void Device::setDescription(const QString &value)
{
    if (value == m_description)
        return;

    m_description = value;
    emit descriptionChanged();
}

QString Device::photo() const
{
    return m_photo;
}

void Device::setPhoto(const QString &value)
{
    if (value == m_photo)
        return;

    m_photo = value;
    emit photoChanged();
}
