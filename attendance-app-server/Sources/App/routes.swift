import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // CRUD Operations for students
    let studentController = StudentController()
    try app.register(collection: studentController)
    
    // CRUD Operations for tracks
    let trackController = TrackController()
    try app.register(collection: trackController)
    
    // CRUD Operations for trackstudents
    let trackstudentController = TrackStudentController()
    try app.register(collection: trackstudentController)
    
    // CRUD Operations for sessions
    let sessionController = SessionController()
    try app.register(collection: sessionController)
    
    // CRUD Operations for attendances
    let attendanceController = AttendanceController()
    try app.register(collection: attendanceController)

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
}
