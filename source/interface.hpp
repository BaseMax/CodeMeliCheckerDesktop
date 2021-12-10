#ifndef INTERFACE_HPP
#define INTERFACE_HPP

#include "common.hpp"

//! Qt
#include <QCoreApplication>
#include <QQmlEngine>
#include <QObject>
#include <QQmlContext>


namespace CodeMeli {

enum class InsertType { Default, File };

class IdCode : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int code READ code WRITE setCode NOTIFY codeChanged)
    Q_PROPERTY(bool status READ status WRITE setStatus NOTIFY statusChanged)

public:
    IdCode(QObject* parent = nullptr);
    ~IdCode();

    /*!
     * \brief setIdCode as INVOKABLE function gets national code and insert type.
     * \return boolean. [returns true if the pattern of id code is correct!]
     */
    Q_INVOKABLE void setIdCode(int code, InsertType type);

    /*!
     * \brief code function
     * \returns national id code as unit [unsigned int]
     */
    int code() const;

    /*!
     * \brief status
     * \return
     */
    bool status() const;

public slots:
    /*!
     * \brief setCode
     * \param id
     */
    void setCode(int id);

    /*!
     * \brief setStatus
     * \param status
     */
    void setStatus(bool status);

signals:
    void codeChanged(int busy);
    void statusChanged(bool status);


private:
    int m_code;
    bool m_status;
};

static void registerIdCodeForQtQuick()
{
    qmlRegisterType<IdCode>("App.IdCode.Interface", 1, 0, "IdCodeInterface");
}

Q_COREAPP_STARTUP_FUNCTION(registerIdCodeForQtQuick)

}

#endif // INTERFACE_HPP
