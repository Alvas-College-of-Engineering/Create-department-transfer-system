package servlet;

import model.Department;
import model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
//import javax.servlet.annotation.WebServlet;
import java.io.IOException;
//import java.util.List;

//@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String message = "";

        // ── CREATE DEPARTMENT ──────────────────────────────────────────────
        if (action.equals("createDept")) {
            int    deptId   = Integer.parseInt(request.getParameter("deptId"));
            String deptName = request.getParameter("deptName");

            if (Storage.deptExists(deptId)) {
                message = "ERROR: Department ID " + deptId + " already exists!";
            } else {
                Storage.getDepartments().add(new Department(deptId, deptName));
                message = "SUCCESS: Department '" + deptName + "' created!";
            }
            request.setAttribute("message", message);
            request.getRequestDispatcher("createDept.jsp").forward(request, response);
        }

        // ── ADD STUDENTS ───────────────────────────────────────────────────
        else if (action.equals("addStudents")) {
            int deptId = Integer.parseInt(request.getParameter("deptId"));
            int count  = Integer.parseInt(request.getParameter("count"));

            Department dept = Storage.findDept(deptId);
            if (dept == null) {
                message = "ERROR: Department not found!";
            } else {
                int added = 0;
                for (int i = 1; i <= count; i++) {
                    String idParam   = request.getParameter("stuId_" + i);
                    String nameParam = request.getParameter("stuName_" + i);

                    if (idParam == null || nameParam == null) continue;

                    int    stuId   = Integer.parseInt(idParam.trim());
                    String stuName = nameParam.trim();

                    if (dept.findStudent(stuId) != null) {
                        message += "SKIP: Student ID " + stuId + " already exists. ";
                        continue;
                    }

                    dept.addStudent(new Student(stuId, stuName));
                    added++;
                }
                message += "SUCCESS: " + added + " student(s) added to " + dept.getDeptName() + "!";
            }
            request.setAttribute("message", message);
            request.setAttribute("departments", Storage.getDepartments());
            request.getRequestDispatcher("addStudent.jsp").forward(request, response);
        }

        // ── TRANSFER STUDENT ───────────────────────────────────────────────
        else if (action.equals("transfer")) {
            int stuId  = Integer.parseInt(request.getParameter("stuId"));
            int fromId = Integer.parseInt(request.getParameter("fromDeptId"));
            int toId   = Integer.parseInt(request.getParameter("toDeptId"));

            Department fromDept = Storage.findDept(fromId);
            Department toDept   = Storage.findDept(toId);

            if (fromDept == null) {
                message = "ERROR: Source Department not found!";
            } else if (toDept == null) {
                message = "ERROR: Destination Department not found!";
            } else if (fromId == toId) {
                message = "ERROR: Student is already in that department!";
            } else {
                Student student = fromDept.findStudent(stuId);
                if (student == null) {
                    message = "ERROR: Student ID " + stuId + " not found in " + fromDept.getDeptName();
                } else {
                    fromDept.removeStudent(stuId);
                    toDept.addStudent(student);
                    message = "SUCCESS: " + student.getName() +
                              " transferred from " + fromDept.getDeptName() +
                              " to " + toDept.getDeptName() + "!";
                }
            }
            request.setAttribute("message", message);
            request.setAttribute("departments", Storage.getDepartments());
            request.getRequestDispatcher("transfer.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // ── DISPLAY ALL ────────────────────────────────────────────────────
        if ("display".equals(action)) {
            request.setAttribute("departments", Storage.getDepartments());
            request.getRequestDispatcher("display.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}