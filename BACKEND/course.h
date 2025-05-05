#ifndef COURSE_H
#define COURSE_H

#include <QString>
#include <QStringList>
#include <QSqlQuery>
#include "databasemanager.h"

class Course {
public:
    Course(DatabaseManager& dbManager);

    // Admin Menu Methods
    bool addCourses(int studentId, const QStringList& courses);

    // Student Menu Methods
    QSqlQuery viewCourses(int studentId);

private:
    DatabaseManager& dbManager;
};

#endif // COURSE_H
