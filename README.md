# Attendance App Server
![Attendance App Server Banner](https://github.com/zhangxijing97/Attendance/blob/main/Screenshots%20Version%201.41/Attendance.png)

Attendance App Server is the backend server-side Swift web application built with Vapor for the [Attendance App](https://github.com/zhangxijing97/Attendance). It provides RESTful APIs for managing class attendance, including CRUD operations for tracks, students, and attendance records.

## Getting Started

### Prerequisites

- [Install Swift](https://swift.org/download/)
- [Install Vapor](https://docs.vapor.codes/4.0/install/macos/)

### Installation

1. Clone the repository:
```
git clone https://github.com/zhangxijing97/attendance-app-server.git
```

2. Change to the project directory:
```
cd attendance-app-server
```

3. Open the project in Xcode:
```
open Package.swift
```

4. Set up the database schema and tables using the included migrations:
```
vapor run migrate
```

5. Run the server:
```
vapor run serve
```


The server should now be running and accessible at `http://localhost:8080`.

## Technologies

- **Vapor:** A server-side Swift web framework for building web apps, APIs, and other server-side software.
- **PostgreSQL:** A powerful, open source object-relational database system used for storing and managing data.
- **RESTful APIs:** The server exposes RESTful APIs to the Attendance App for CRUD operations on tracks, students, and attendance records.

## License

The Attendance App Server is released under the MIT License. See [LICENSE](LICENSE) for details.

## Credits

The Attendance App Server was created by Xijing Zhang. If you have any questions or feedback, please email us at zhangxijing97@gmail.com.
