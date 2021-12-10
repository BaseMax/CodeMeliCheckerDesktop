#include "interface.hpp"

namespace CodeMeli {

IdCode::IdCode(QObject* parent)
    : QObject(parent), m_status(false)
{

}


CodeMeli::IdCode::~IdCode() {}

void IdCode::setIdCode(int code, InsertType type) {
    //ToDo...
    bool res{false};
    setStatus(false);
}

int IdCode::code() const {
    return m_code;
}

bool IdCode::status() const {
    return m_status;
}

void IdCode::setCode(int id) {
    if (m_code == id)
        return;
    m_code = id;
    emit codeChanged(m_code);
}

void IdCode::setStatus(bool status) {
    if (m_status == status)
        return;
    m_status = status;
    emit statusChanged(m_status);
}

}

