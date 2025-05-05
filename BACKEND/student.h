#ifndef STUDENT_H
#define STUDENT_H

#include <QString>
#include <QSqlQuery>
#include "databasemanager.h"

class Student {
public:
    Student(DatabaseManager& dbManager);

    // Admin Menu Methods
    bool addStudent(const QString& name, const QString& password, const QString& gender,
                    const QString& email, const QString& phoneNumber, const QString& address);
    QSqlQuery viewAllStudents();
    bool updateStudent(int studentId, const QString& name, const QString& password, const QString& gender,
                       const QString& email, const QString& phoneNumber, const QString& address);
    bool deleteStudent(int studentId);

    // Student Menu Methods
    QSqlQuery viewStudent(int studentId);
    bool updatePassword(int studentId, const QString& newPassword);

private:
    DatabaseManager& dbManager;
};

#endif // STUDENT_H
