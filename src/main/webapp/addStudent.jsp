<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, model.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Students</title>
    <style>
        body  { font-family: Arial; background: #f0f2f5; }
        h2    { background: #2c3e50; color: white; padding: 15px; }
        .box  { width: 500px; margin: 30px auto; background: white;
                padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        input, select { width: 100%; padding: 10px; margin: 8px 0;
                        box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .btn  { width: 100%; padding: 12px; background: #2980b9; color: white;
                border: none; border-radius: 4px; font-size: 15px; cursor: pointer; }
        .btn:hover  { background: #1a5276; }
        .back { display: block; margin-top: 15px; text-align: center; color: #2980b9; }
        #studentFields { margin-top: 15px; }
        .student-row { background: #f8f9fa; padding: 10px; border-radius: 4px; margin: 8px 0; }
        .msg  { padding: 10px; border-radius: 4px; margin-bottom: 15px; font-weight: bold; }
        .success { background: #d4edda; color: #155724; }
        .error   { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2>Add Students to Department</h2>
    <div class="box">

        <% String msg = (String) request.getAttribute("message");
           if (msg != null) { %>
            <div class="msg <%= msg.contains("SUCCESS") ? "success" : "error" %>">
                <%= msg %>
            </div>
        <% } %>

        <!-- Step 1: Choose dept and how many students -->
        <form action="DepartmentServlet" method="post" id="addForm">
            <input type="hidden" name="action" value="addStudents"/>

            <label>Department ID:</label>
            <input type="number" name="deptId" id="deptId" placeholder="Enter Department ID" required/>

            <label>How many students to add?</label>
            <input type="number" name="count" id="count" placeholder="Enter count" min="1" required/>

            <button type="button" class="btn" onclick="generateFields()" style="background:#8e44ad;">
                Generate Student Fields
            </button>

            <div id="studentFields"></div>

            <button class="btn" type="submit" id="submitBtn" style="display:none; margin-top:10px;">
                Add Students
            </button>
        </form>
        <a class="back" href="index.jsp">← Back to Menu</a>
    </div>

    <script>
        // Dynamically generate N student input fields
        function generateFields() {
            var count = document.getElementById("count").value;
            if (!count || count < 1) {
                alert("Enter a valid count!");
                return;
            }
            var html = "";
            for (var i = 1; i <= count; i++) {
                html += '<div class="student-row">';
                html += '<strong>Student ' + i + '</strong><br>';
                html += '<input type="number" name="stuId_'   + i + '" placeholder="Student ID" required/>';
                html += '<input type="text"   name="stuName_' + i + '" placeholder="Student Name" required/>';
                html += '</div>';
            }
            document.getElementById("studentFields").innerHTML = html;
            document.getElementById("submitBtn").style.display = "block";
        }
    </script>
</body>
</html>