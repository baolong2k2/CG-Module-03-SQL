package com.example.test.model.dao;

import com.example.test.model.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    private static List<Student> students = new ArrayList<>();

    public void addStudent(Student student) {
        students.add(student);
    }

    public List<Student> getAllStudents() {
        return students;
    }

    public Student getStudentByName(String name) {
        for (Student student : students) {
            if (student.getName().equalsIgnoreCase(name)) {
                return student;
            }
        }
        return null;
    }

    public void updateStudent(Student student) {
        // Implement the update logic here
    }

    public void deleteStudent(Student student) {
        students.remove(student);
    }
}

