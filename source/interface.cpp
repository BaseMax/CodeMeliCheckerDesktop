#include "interface.hpp"

namespace CodeMelli {

IdCode::IdCode(QObject* parent)
    : QObject(parent), m_status(false)
{

}


CodeMelli::IdCode::~IdCode() {}

void IdCode::setIdCode(const QString& code) {
    //ToDo...
    qDebug() << code;
    bool res{true};
    setStatus(res);
}

QString IdCode::code() const {
    return m_code;
}

bool IdCode::status() const {
    return m_status;
}

void IdCode::setCode(QString code) {
    if (m_code == code)
        return;
    m_code = code;
    emit codeChanged(m_code);
}

void IdCode::setStatus(bool status) {
    if (m_status == status)
        return;
    m_status = status;
    emit statusChanged(m_status);
}

}
