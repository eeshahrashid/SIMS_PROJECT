#ifndef PROGRESS_H
#define PROGRESS_H

#include <QString>
#include <QSqlQuery>
#include "databasemanager.h"

class Progress {
public:
    Progress(DatabaseManager& dbManager);

    // Admin Menu Methods
    bool addProgress(int studentId, const QString& courseName, double percentage);

    // Student Menu Methods
    QSqlQuery viewProgress(int studentId);

private:
    DatabaseManager& dbManager;
};

#endif // PROGRESS_H
