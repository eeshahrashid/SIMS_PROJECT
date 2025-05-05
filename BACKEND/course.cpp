#include "course.h"

Course::Course(DatabaseManager& dbManager) : dbManager(dbManager) {}

// Add courses for a student
bool Course::addCourses(int studentId, const QStringList& courses) {
    for (const QString& course : courses) {
        // Check if the course already exists for the student
        QString checkQuery = QString("SELECT * FROM Courses WHERE student_id = %1 AND course_name = '%2'")
                                 .arg(QString::number(studentId), course);
        QSqlQuery checkResult = dbManager.executeSelectQuery(checkQuery);

        if (checkResult.next()) {
            qDebug() << "Course" << course << "already exists for student ID" << studentId;
            continue; // Skip adding this course
        }

        // Add the course
        QString query = QString("INSERT INTO Courses (student_id, course_name) "
                                "VALUES (%1, '%2')")
                            .arg(QString::number(studentId), course);
        if (!dbManager.executeQuery(query)) {
            return false;
        }
    }
    return true;
}
// View courses for a student
QSqlQuery Course::viewCourses(int studentId) {
    QString query = QString("SELECT course_name FROM Courses WHERE student_id = %1")
    .arg(QString::number(studentId));
    return dbManager.executeSelectQuery(query);
}
