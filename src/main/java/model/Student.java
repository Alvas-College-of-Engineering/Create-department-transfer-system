package model;

public class Student {
    private int id;
    private String name;
    private int deptId;

    public Student(int id, String name) {
        this.id   = id;
        this.name = name;
    }

    public int    getId()           { return id; }
    public String getName()         { return name; }
    public int    getDeptId()       { return deptId; }
    public void   setDeptId(int d)  { this.deptId = d; }

    @Override
    public String toString() {
        return "ID=" + id + ", Name=" + name + ", DeptID=" + deptId;
    }
}