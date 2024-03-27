#ifndef __DEVICES_MODEL_H__
#define __DEVICES_MODEL_H__

#include <QAbstractListModel>
#include <QList>
#include <QSharedPointer>

#include "Device.hpp"

#define DEVICES_COLCOUNT 5

/**
 * @brief The DevicesModel class
 * this class is a QAbstractListModel, which makes it possible to display data
 * in a ListView (QML)
 */
class DevicesModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ rowCount NOTIFY countChanged)
    Q_ENUMS(Role Column)

public:
    explicit DevicesModel(QObject *parent = nullptr);
    ~DevicesModel();

    // these methods override QAbstractListModel
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    enum Column {
        RefColumn,
        MajorVersionColumn,
        MinorVersionColumn,
        DescriptionColumn,
        PhotoColumn
    };

    enum Role {
        RefRole = Qt::UserRole + RefColumn,
        MajorVersionRole = Qt::UserRole + MajorVersionColumn,
        MinorVersionRole = Qt::UserRole + MinorVersionColumn,
        DescriptionRole = Qt::UserRole + DescriptionColumn,
        PhotoRole = Qt::UserRole + PhotoColumn
    };

    /**
     * @brief give the column which corresponds to the provided role
     * @param role
     * @return the matching column (int)
     */
    static inline int toColumn(Role role);

    /**
     * @brief appendDevice
     * append a device to the model
     * @return the number of elements in the model
     */
    int appendDevice(const Device&);

signals:
    void countChanged();

private:
    QList<QSharedPointer<Device>> m_devicesList; /**< the list of devices, as shared pointers */
};

Q_DECLARE_METATYPE(DevicesModel*)

#endif /* __DEVICES_MODEL_H__ */
