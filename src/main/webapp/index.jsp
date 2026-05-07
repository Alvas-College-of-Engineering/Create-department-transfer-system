<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Department Transfer System</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; text-align: center; }
        h1   { background: #2c3e50; color: white; padding: 20px; margin: 0; }
        .menu { display: inline-block; margin-top: 60px; }
        .btn {
            display: block;
            width: 300px;
            padding: 15px;
            margin: 12px auto;
            background: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
        }
        .btn:hover { background: #1a5276; }
    </style>
</head>
<body>
    <h1>Department Transfer System</h1>
    <div class="menu">
        <a class="btn" href="createDept.jsp">1. Create Department</a>
        <a class="btn" href="addStudent.jsp">2. Add Students to Department</a>
        <a class="btn" href="transfer.jsp">3. Transfer Student</a>
        <a class="btn" href="DepartmentServlet?action=display">4. Display All</a>
    </div>
</body>
</html>