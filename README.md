# 🏫 Department Transfer System

A Java-based web application that allows students or employees to request transfers between departments, validates eligibility, updates department records, and displays transfer status.

---

## 📌 Project Description

The **Department Transfer System** is a dynamic web project built using **JSP and Servlet** that manages departments and students. Users can create departments, add multiple students, transfer students between departments, and view all department records — all without a database (in-memory storage).

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java | Core logic and backend |
| JSP (JavaServer Pages) | Frontend web pages |
| Servlet | Request handling and routing |
| HTML + CSS | UI styling |
| JavaScript | Dynamic form generation |
| Apache Tomcat 9+ | Web server |
| Eclipse IDE | Development environment |

---

## 📁 Project Structure

```
StudentTransferSys/
└── src/
    └── main/
        ├── java/
        │   ├── model/
        │   │   ├── Student.java           # Student entity (ID, Name, DeptID)
        │   │   └── Department.java        # Department entity with student list
        │   └── servlet/
        │       ├── Storage.java           # In-memory static list (acts as DB)
        │       └── DepartmentServlet.java # Main servlet handling all requests
        └── webapp/
            ├── WEB-INF/
            │   ├── lib/
            │   │   └── servlet-api.jar    # Servlet dependency
            │   └── web.xml                # Servlet mapping configuration
            ├── index.jsp                  # Home page / Menu
            ├── createDept.jsp             # Create Department page
            ├── addStudent.jsp             # Add Students page
            ├── transfer.jsp               # Transfer Student page
            └── display.jsp                # Display All Departments page
```

---

## ⚙️ Features

- ✅ **Create Department** — Add departments with unique ID and name
- ✅ **Add Multiple Students** — Add N number of students to a department dynamically
- ✅ **Transfer Student** — Move a student from one department to another with validation
- ✅ **Display All** — View all departments and their enrolled students in a table
- ✅ **Duplicate Check** — Prevents duplicate department IDs and student IDs
- ✅ **In-Memory Storage** — No database required, uses static Java List

---

## 🔁 Application Flow

```
index.jsp (Menu)
    │
    ├── createDept.jsp   ──POST──► DepartmentServlet (action=createDept)
    ├── addStudent.jsp   ──POST──► DepartmentServlet (action=addStudents)
    ├── transfer.jsp     ──POST──► DepartmentServlet (action=transfer)
    └── display.jsp      ◄──GET──  DepartmentServlet (action=display)
                                          │
                                    Storage.java
                                  (static List<Department>)
```

---

## 🚀 How to Run

### Prerequisites
- Java JDK 8 or above
- Apache Tomcat 9+
- Eclipse IDE (Dynamic Web Project)

### Steps

**1. Clone the Repository**
```bash
git clone https://github.com/Alvas-College-of-Engineering/Create-department-transfer-system.git
```

**2. Import into Eclipse**
```
File → Import → Existing Projects into Workspace
→ Select cloned folder → Finish
```

**3. Add Tomcat Server**
```
Right-click Project → Build Path → Configure Build Path
→ Libraries → Add Library → Server Runtime → Select Tomcat → Finish
```

**4. Add servlet-api.jar**
```
Copy servlet-api.jar from: apache-tomcat/lib/
Paste into: WEB-INF/lib/
```

**5. Run the Project**
```
Right-click Project → Run As → Run on Server → Select Tomcat → Finish
```

**6. Open in Browser**
```
http://localhost:8080/StudentTransferSys/
```

---

## 📸 Pages Overview

| Page | URL | Description |
|---|---|---|
| Home Menu | `/index.jsp` | Navigation to all features |
| Create Department | `/createDept.jsp` | Form to create a new department |
| Add Students | `/addStudent.jsp` | Dynamically add N students to a dept |
| Transfer Student | `/transfer.jsp` | Transfer student between departments |
| Display All | `/DepartmentServlet?action=display` | View all departments and students |

---

## 👥 Classes Overview

### Student.java
```
Fields  : id, name, deptId
Methods : getId(), getName(), getDeptId(), setDeptId()
```

### Department.java
```
Fields  : deptId, deptName, List<Student>
Methods : addStudent(), findStudent(), removeStudent(), getStudents()
```

### Storage.java
```
Type    : Utility class with static List<Department>
Methods : getDepartments(), findDept(), deptExists()
```

### DepartmentServlet.java
```
Type    : HttpServlet handling POST and GET
Actions : createDept, addStudents, transfer, display
```

---

## ✅ Validations

- Department ID must be unique
- Student ID must be unique within a department
- Cannot transfer to the same department
- Source and destination departments must exist
- Student must exist in the source department before transfer

---

## 📚 Concepts Used

- **OOP** — Encapsulation, Composition (Department HAS Students)
- **Servlet Lifecycle** — doGet(), doPost() handling
- **JSP Scriplets** — Dynamic HTML generation using Java in JSP
- **Request Attributes** — Passing data from Servlet to JSP
- **In-Memory Storage** — Static List as temporary data store
- **JavaScript** — Dynamic form field generation for N students

---

## 👨‍💻 Developed By

**Jeeva**
Student, Computer Science Engineering
Alvas College of Engineering

---

## 🏫 Organization

**Alvas College of Engineering**
[GitHub Organization](https://github.com/Alvas-College-of-Engineering)
