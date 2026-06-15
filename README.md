# Smart Hostel & Seat Management System

A desktop application written in Java utilizing Swing for the UI and MySQL (via JDBC) for database storage. It helps hostel wardens and admins manage students, room capacity, seat allocations, payments, complaints, and visitor logs.

## Features

- **Authentication**: Secure admin login flow.
- **Student Management**: Full CRUD operations for student records.
- **Room Management**: Keep track of room details, prices, overall capacities, occupancy status, and maintenance.
- **Seat Allocation**: Smoothly allocate students to rooms with validation preventing allocation to full or unavailable rooms. Automatically updates occupancy status.
- **Payment History**: Record monthly rent/payment status for student accounts.
- **Complaint Tracking**: Add new complaints and update their statuses (e.g. pending to resolved).
- **Visitor Logs**: Keep track of guest details, visit dates, in-times, and out-times.

---

## Technical Architecture

The codebase follows the Standard DAO (Data Access Object) design pattern:

- **Model Layer**: Plain Java entities representing DB tables (`Student.java`, `Room.java`, etc.).
- **DAO Layer**: JDBC classes that execute query statements to manipulate tables.
- **Service Layer**: Business rules and operations validation (e.g., preventing duplication or allocation when a room is full).
- **UI Layer**: Java Swing UI components (`LoginFrame.java`, `DashboardFrame.java`, forms).
- **Utils**: Field validation checkers (`Validator.java`) and standard alert dialogues (`Alert.java`).

---

## Configuration & Requirements

1. **MySQL Server**: Ensure MySQL server is running (e.g., using XAMPP, WampServer, or direct installation).
2. **Database Setup**:
   - Create a database named `hostel_management`.
   - Run the script located at `database/hostel_management.sql` to generate all needed tables and insert the default admin user.
3. **JDBC Connector**:
   - Download the MySQL JDBC Driver (`mysql-connector-j.jar`) from [MySQL Downloads](https://dev.mysql.com/downloads/connector/j/).
   - Place the `.jar` inside the `lib/` directory as `lib/mysql-connector-j.jar`.

### Default Credentials
- **Username**: `admin`
- **Password**: `admin123`

---

## Building and Running

You can compile and run the project from your command prompt / terminal.

### Compilation

From the `SmartHostelManagement` directory:
```bash
# Create bin directory for compiler output
mkdir bin

# Compile all source files placing them inside bin/, ensuring lib/mysql-connector-j.jar is in classpath
javac -d bin -cp "lib/mysql-connector-j.jar" src/app/Main.java src/config/*.java src/model/*.java src/dao/*.java src/service/*.java src/ui/*.java src/utils/*.java
```

### Running

```bash
# Run the application
java -cp "bin;lib/mysql-connector-j.jar" app.Main
```
*(On macOS/Linux, use a colon `:` instead of semicolon `;` for separating items in the classpath)*
