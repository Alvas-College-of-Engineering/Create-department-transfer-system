package model;

import java.util.ArrayList;
import java.util.List;

public class Department {
    private int deptId;
    private String deptName;
    private List<Student> students;

    public Department(int deptId, String deptName) {
        this.deptId   = deptId;
        this.deptName = deptName;
        this.students = new ArrayList<>();
    }

    public void addStudent(Student s) {
        s.setDeptId(this.deptId);
        this.students.add(s);
    }

    public Student findStudent(int studentId) {
        for (Student s : students) {
            if (s.getId() == studentId) return s;
        }
        return null;
    }

    public boolean removeStudent(int studentId) {
        return students.removeIf(s -> s.getId() == studentId);
    }

    public int             getDeptId()   { return deptId; }
    public String          getDeptName() { return deptName; }
    public List<Student>   getStudents() { return students; }
}