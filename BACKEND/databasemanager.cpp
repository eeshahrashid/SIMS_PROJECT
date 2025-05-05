#include "databasemanager.h"

DatabaseManager::DatabaseManager(const QString& path) {
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);

    if (!db.open()) {
        qDebug() << "Error: Could not open database.";
    } else {
        qDebug() << "Database connected successfully.";
        initializeDatabase();
    }
}

DatabaseManager::~DatabaseManager() {
    if (db.isOpen()) {
        db.close();
    }
}

bool DatabaseManager::executeQuery(const QString& query) {
    QSqlQuery q;
    if (!q.exec(query)) {
        qDebug() << "Query error:" << q.lastError();
        return false;
    }
    return true;
}

QSqlQuery DatabaseManager::executeSelectQuery(const QString& query) {
    QSqlQuery q;
    if (!q.exec(query)) {
        qDebug() << "Select query error:" << q.lastError();
    }
    return q;
}

void DatabaseManager::initializeDatabase() {
    // Create Students table
    executeQuery("CREATE TABLE IF NOT EXISTS Students ("
                 "student_id INTEGER PRIMARY KEY AUTOINCREMENT, "
                 "name TEXT NOT NULL, "
                 "password TEXT NOT NULL, "
                 "gender TEXT NOT NULL, "
                 "email TEXT NOT NULL, "
                 "phone_number TEXT NOT NULL, "
                 "address TEXT NOT NULL)");

    // Create Courses table
    executeQuery("CREATE TABLE IF NOT EXISTS Courses ("
                 "student_id INTEGER, "
                 "course_name TEXT NOT NULL, "
                 "FOREIGN KEY (student_id) REFERENCES Students(student_id), "
                 "PRIMARY KEY (student_id, course_name))");

    // Create Attendance table
    executeQuery("CREATE TABLE IF NOT EXISTS Attendance ("
                 "student_id INTEGER, "
                 "course_name TEXT NOT NULL, "
                 "classes_attended INTEGER, "
                 "FOREIGN KEY (student_id) REFERENCES Students(student_id), "
                 "PRIMARY KEY (student_id, course_name))");

    // Create Progress table
    executeQuery("CREATE TABLE IF NOT EXISTS Progress ("
                 "student_id INTEGER, "
                 "course_name TEXT NOT NULL, "
                 "percentage REAL, "
                 "FOREIGN KEY (student_id) REFERENCES Students(student_id), "
                 "PRIMARY KEY (student_id, course_name))");

    qDebug() << "Database initialized successfully.";
}
