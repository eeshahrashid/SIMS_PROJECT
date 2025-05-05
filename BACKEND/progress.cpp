#include "progress.h"

Progress::Progress(DatabaseManager& dbManager) : dbManager(dbManager) {}

// Add progress for a student's course
bool Progress::addProgress(int studentId, const QString& courseName, double percentage) {
    // Check if progress already exists for the student and course
    QString checkQuery = QString("SELECT * FROM Progress WHERE student_id = %1 AND course_name = '%2'")
                             .arg(QString::number(studentId), courseName);
    QSqlQuery checkResult = dbManager.executeSelectQuery(checkQuery);

    if (checkResult.next()) {
        qDebug() << "Progress already exists for student ID" << studentId << "and course" << courseName;
        return false; // Skip adding progress
    }

    // Add progress
    QString query = QString("INSERT INTO Progress (student_id, course_name, percentage) "
                            "VALUES (%1, '%2', %3)")
                        .arg(QString::number(studentId), courseName, QString::number(percentage));
    return dbManager.executeQuery(query);
}

// View progress for a student
QSqlQuery Progress::viewProgress(int studentId) {
    QString query = QString("SELECT course_name, percentage FROM Progress WHERE student_id = %1")
    .arg(QString::number(studentId));
    return dbManager.executeSelectQuery(query);
}
