#include "DevicesModel.hpp"

DevicesModel::DevicesModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

DevicesModel::~DevicesModel()
{
}

int DevicesModel::rowCount(const QModelIndex &parent) const
{
    if (!parent.isValid())
        return m_devicesList.size();
    else
        return 0;
}

int DevicesModel::columnCount(const QModelIndex &parent) const
{
    return parent.isValid() ? 0 : DEVICES_COLCOUNT;
}

QVariant DevicesModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    else if (index.row() < 0 ||
             index.row() >= m_devicesList.count())
        return QVariant();

    int col;
    if (role >= Qt::UserRole)
        col = DevicesModel::toColumn(static_cast<Role>(role));
    else if (role != Qt::DisplayRole && role != Qt::EditRole)
        return QVariant();
    else
        col = index.column();

    switch (col)
    {
    case RefColumn:
        return m_devicesList.at(index.row())->ref();
    case MajorVersionColumn:
        return m_devicesList.at(index.row())->majorVersion();
    case MinorVersionColumn:
        return m_devicesList.at(index.row())->minorVersion();
    case DescriptionColumn:
        return m_devicesList.at(index.row())->description();
    case PhotoColumn:
        return m_devicesList.at(index.row())->photo();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> DevicesModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[RefRole] = "ref";
    roles[MajorVersionRole] = "majorV";
    roles[MinorVersionRole] = "minorV";
    roles[DescriptionRole] = "description";
    roles[PhotoRole] = "photo";
    return roles;
}

int DevicesModel::toColumn(DevicesModel::Role role)
{
    return static_cast<int>(role - Qt::UserRole);
}

int DevicesModel::appendDevice(const Device& d)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    // instanciate a Device from the provided Device..
    QSharedPointer<Device> myDev(new Device(d));
    // ..and append it to the list !
    m_devicesList.append(myDev);
    endInsertRows();
    return m_devicesList.count();
}

