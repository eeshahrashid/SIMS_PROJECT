#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

class DatabaseManager {
public:
    DatabaseManager(const QString& path);
    ~DatabaseManager();

    bool executeQuery(const QString& query);
    QSqlQuery executeSelectQuery(const QString& query);

private:
    void initializeDatabase();
    QSqlDatabase db;
};

#endif // DATABASEMANAGER_H
