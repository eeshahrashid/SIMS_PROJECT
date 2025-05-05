#ifndef ATTENDANCE_H
#define ATTENDANCE_H

#include <QString>
#include <QSqlQuery>
#include "databasemanager.h"

class Attendance {
public:
    Attendance(DatabaseManager& dbManager);

    // Admin Menu Methods
    bool addAttendance(int studentId, const QString& courseName, int classesAttended);

    // Student Menu Methods
    QSqlQuery viewAttendance(int studentId);

private:
    DatabaseManager& dbManager;
};

#endif // ATTENDANCE_H
