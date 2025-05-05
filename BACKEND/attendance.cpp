#include "attendance.h"

Attendance::Attendance(DatabaseManager& dbManager) : dbManager(dbManager) {}

// Add attendance for a student's course
bool Attendance::addAttendance(int studentId, const QString& courseName, int classesAttended) {
    // Check if attendance already exists for the student and course
    QString checkQuery = QString("SELECT * FROM Attendance WHERE student_id = %1 AND course_name = '%2'")
                             .arg(QString::number(studentId), courseName);
    QSqlQuery checkResult = dbManager.executeSelectQuery(checkQuery);

    if (checkResult.next()) {
        qDebug() << "Attendance already exists for student ID" << studentId << "and course" << courseName;
        return false; // Skip adding attendance
    }

    // Add attendance
    QString query = QString("INSERT INTO Attendance (student_id, course_name, classes_attended) "
                            "VALUES (%1, '%2', %3)")
                        .arg(QString::number(studentId), courseName, QString::number(classesAttended));
    return dbManager.executeQuery(query);
}

// View attendance for a student
QSqlQuery Attendance::viewAttendance(int studentId) {
    QString query = QString("SELECT course_name, classes_attended FROM Attendance WHERE student_id = %1")
    .arg(QString::number(studentId));
    return dbManager.executeSelectQuery(query);
}
