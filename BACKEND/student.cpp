#include "student.h"

Student::Student(DatabaseManager& dbManager) : dbManager(dbManager) {}

// Add a new student
bool Student::addStudent(const QString& name, const QString& password, const QString& gender,
                         const QString& email, const QString& phoneNumber, const QString& address) {
    QString query = QString("INSERT INTO Students (name, password, gender, email, phone_number, address) "
                            "VALUES ('%1', '%2', '%3', '%4', '%5', '%6')")
                        .arg(name, password, gender, email, phoneNumber, address);
    return dbManager.executeQuery(query);
}

// View all students
QSqlQuery Student::viewAllStudents() {
    QString query = "SELECT * FROM Students";
    return dbManager.executeSelectQuery(query);
}

// Update a student's details
bool Student::updateStudent(int studentId, const QString& name, const QString& password, const QString& gender,
                            const QString& email, const QString& phoneNumber, const QString& address) {
    QString query = QString("UPDATE Students SET name = '%1', password = '%2', gender = '%3', "
                            "email = '%4', phone_number = '%5', address = '%6' WHERE student_id = %7")
                        .arg(name, password, gender, email, phoneNumber, address, QString::number(studentId));
    return dbManager.executeQuery(query);
}

// Delete a student
bool Student::deleteStudent(int studentId) {
    QString query = QString("DELETE FROM Students WHERE student_id = %1")
    .arg(QString::number(studentId));
    return dbManager.executeQuery(query);
}

// View a student's profile
QSqlQuery Student::viewStudent(int studentId) {
    QString query = QString("SELECT * FROM Students WHERE student_id = %1")
    .arg(QString::number(studentId));
    return dbManager.executeSelectQuery(query);
}

// Update a student's password
bool Student::updatePassword(int studentId, const QString& newPassword) {
    QString query = QString("UPDATE Students SET password = '%1' WHERE student_id = %2")
    .arg(newPassword, QString::number(studentId));
    return dbManager.executeQuery(query);
}
