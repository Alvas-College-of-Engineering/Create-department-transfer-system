<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Departments</title>
    <style>
        body  { font-family: Arial; background: #f0f2f5; }
        h2    { background: #2c3e50; color: white; padding: 15px; }
        .container { width: 700px; margin: 30px auto; }
        .dept-card  { background: white; border-radius: 8px; margin: 15px 0;
                      padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .dept-title { font-size: 17px; font-weight: bold; color: #2c3e50;
                      border-bottom: 2px solid #2980b9; padding-bottom: 8px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th    { background: #2980b9; color: white; padding: 8px; text-align: left; }
        td    { padding: 8px; border-bottom: 1px solid #eee; }
        tr:hover td { background: #f0f2f5; }
        .empty { color: #999; font-style: italic; }
        .back { display: block; margin: 20px auto; text-align: center; color: #2980b9; }
    </style>
</head>
<body>
    <h2>All Departments and Students</h2>
    <div class="container">
        <%
        	@SuppressWarnings("unchecked")
            List<Department> departments = (List<Department>) request.getAttribute("departments");
            if (departments == null || departments.isEmpty()) {
        %>
            <p style="text-align:center; color:#999;">No departments created yet.</p>
        <%
            } else {
                for (Department dept : departments) {
        %>
            <div class="dept-card">
                <div class="dept-title">
                    Dept ID: <%= dept.getDeptId() %> | <%= dept.getDeptName() %>
                    &nbsp;&nbsp;
                    <span style="font-size:13px; color:#666;">
                        (Total Students: <%= dept.getStudents().size() %>)
                    </span>
                </div>
                <% if (dept.getStudents().isEmpty()) { %>
                    <p class="empty">No students enrolled.</p>
                <% } else { %>
                    <table>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Dept ID</th>
                        </tr>
                        <% for (Student s : dept.getStudents()) { %>
                        <tr>
                            <td><%= s.getId() %></td>
                            <td><%= s.getName() %></td>
                            <td><%= s.getDeptId() %></td>
                        </tr>
                        <% } %>
                    </table>
                <% } %>
            </div>
        <%  }
            } %>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>