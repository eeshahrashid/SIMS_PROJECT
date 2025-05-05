#include <QCoreApplication>
#include <QStringList>
#include <QDebug>
#include "databasemanager.h"
#include "student.h"
#include "course.h"
#include "attendance.h"
#include "progress.h"

int main(int argc, char *argv[]) {
    QCoreApplication a(argc, argv);

    // Initialize the database
    DatabaseManager dbManager("../SIMS/student_management.db");
    // Command-line sanity dump: --dump
    QStringList args = a.arguments();
    bool dumpMode = args.contains(QStringLiteral("--dump"));
    if (dumpMode) {
        // Dump all tables
        qDebug() << "=== Students ===";
        QSqlQuery q1 = dbManager.executeSelectQuery("SELECT * FROM Students");
        while (q1.next()) {
            qDebug() << "ID:" << q1.value("student_id").toInt()
                     << "Name:" << q1.value("name").toString()
                     << "Password:" << q1.value("password").toString()
                     << "Gender:" << q1.value("gender").toString()
                     << "Email:" << q1.value("email").toString()
                     << "Phone:" << q1.value("phone_number").toString()
                     << "Address:" << q1.value("address").toString();
        }
        qDebug() << "=== Courses ===";
        QSqlQuery q2 = dbManager.executeSelectQuery("SELECT * FROM Courses");
        while (q2.next()) {
            qDebug() << "Student ID:" << q2.value("student_id").toInt()
                     << "Course:" << q2.value("course_name").toString();
        }
        qDebug() << "=== Attendance ===";
        QSqlQuery q3 = dbManager.executeSelectQuery("SELECT * FROM Attendance");
        while (q3.next()) {
            qDebug() << "Student ID:" << q3.value("student_id").toInt()
                     << "Course:" << q3.value("course_name").toString()
                     << "Attended:" << q3.value("classes_attended").toInt();
        }
        qDebug() << "=== Progress ===";
        QSqlQuery q4 = dbManager.executeSelectQuery("SELECT * FROM Progress");
        while (q4.next()) {
            qDebug() << "Student ID:" << q4.value("student_id").toInt()
                     << "Course:" << q4.value("course_name").toString()
                     << "Percentage:" << q4.value("percentage").toDouble();
        }
        return 0;
    }

    // Test Student class
    Student student(dbManager);

    // Add a student
    if (student.addStudent("John Doe", "1234", "Male", "john@example.com", "1234567890", "123 Main St")) {
        qDebug() << "Student added successfully!";
    } else {
        qDebug() << "Failed to add student.";
    }

    // View all students
    QSqlQuery allStudents = student.viewAllStudents();
    while (allStudents.next()) {
        qDebug() << "Student ID:" << allStudents.value("student_id").toInt()
        << "| Name:" << allStudents.value("name").toString()
        << "| Email:" << allStudents.value("email").toString();
    }

    // Update a student's details
    if (student.updateStudent(1, "John Doe Updated", "1234", "Male", "john.updated@example.com", "1234567890", "123 Main St")) {
        qDebug() << "Student updated successfully!";
    } else {
        qDebug() << "Failed to update student.";
    }

    // View a specific student's profile
    QSqlQuery studentProfile = student.viewStudent(1);
    while (studentProfile.next()) {
        qDebug() << "Student Profile:"
                 << "ID:" << studentProfile.value("student_id").toInt()
                 << "| Name:" << studentProfile.value("name").toString()
                 << "| Email:" << studentProfile.value("email").toString();
    }

    // Update a student's password
    if (student.updatePassword(1, "newpassword123")) {
        qDebug() << "Password updated successfully!";
    } else {
        qDebug() << "Failed to update password.";
    }

    // Test Course class
    Course course(dbManager);

    // Add courses for a student
    QStringList courses = {"Mathematics", "Physics", "Chemistry", "Biology", "Computer Science"};
    if (course.addCourses(1, courses)) {
        qDebug() << "Courses added successfully!";
    } else {
        qDebug() << "Failed to add courses.";
    }

    // View courses for a student
    QSqlQuery studentCourses = course.viewCourses(1);
    while (studentCourses.next()) {
        qDebug() << "Course:" << studentCourses.value("course_name").toString();
    }

    // Test Attendance class
    Attendance attendance(dbManager);

    // Add attendance for a student's course
    if (attendance.addAttendance(1, "Mathematics", 8)) {
        qDebug() << "Attendance added successfully!";
    } else {
        qDebug() << "Failed to add attendance.";
    }

    // View attendance for a student
    QSqlQuery studentAttendance = attendance.viewAttendance(1);
    while (studentAttendance.next()) {
        qDebug() << "Course:" << studentAttendance.value("course_name").toString()
        << "| Classes Attended:" << studentAttendance.value("classes_attended").toInt();
    }

    // Test Progress class
    Progress progress(dbManager);

    // Add progress for a student's course
    if (progress.addProgress(1, "Mathematics", 85.5)) {
        qDebug() << "Progress added successfully!";
    } else {
        qDebug() << "Failed to add progress.";
    }

    // View progress for a student
    QSqlQuery studentProgress = progress.viewProgress(1);
    while (studentProgress.next()) {
        qDebug() << "Course:" << studentProgress.value("course_name").toString()
        << "| Percentage:" << studentProgress.value("percentage").toDouble();
    }

    // Delete a student (optional, for testing)
    if (student.deleteStudent(1)) {
        qDebug() << "Student deleted successfully!";
    } else {
        qDebug() << "Failed to delete student.";
    }

    return a.exec();
}
