package servlet;

import model.Department;
import java.util.ArrayList;
import java.util.List;

public class Storage {

    // Static list — lives as long as server is running
    private static List<Department> departments = new ArrayList<>();

    public static List<Department> getDepartments() {
        return departments;
    }

    public static Department findDept(int deptId) {
        for (Department d : departments) {
            if (d.getDeptId() == deptId) return d;
        }
        return null;
    }

    public static boolean deptExists(int deptId) {
        return findDept(deptId) != null;
    }
}