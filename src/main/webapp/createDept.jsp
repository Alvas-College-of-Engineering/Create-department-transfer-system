<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Department</title>
    <style>
        body  { font-family: Arial; background: #f0f2f5; }
        h2    { background: #2c3e50; color: white; padding: 15px; }
        .box  { width: 400px; margin: 40px auto; background: white;
                padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        input { width: 100%; padding: 10px; margin: 10px 0; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .btn  { width: 100%; padding: 12px; background: #27ae60; color: white;
                border: none; border-radius: 4px; font-size: 15px; cursor: pointer; }
        .btn:hover  { background: #1e8449; }
        .back { display: block; margin-top: 15px; text-align: center; color: #2980b9; }
        .msg  { padding: 10px; border-radius: 4px; margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>Create Department</h2>
    <div class="box">

        <% String msg = (String) request.getAttribute("message");
           if (msg != null) { %>
            <div class="msg <%= msg.startsWith("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <form action="DepartmentServlet" method="post">
            <input type="hidden" name="action" value="createDept"/>
            <label>Department ID:</label>
            <input type="number" name="deptId" placeholder="Enter Department ID" required/>
            <label>Department Name:</label>
            <input type="text" name="deptName" placeholder="Enter Department Name" required/>
            <button class="btn" type="submit">Create Department</button>
        </form>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>
</body>
</html>