import Fluent
import Vapor

struct Context: Content {
    let students: [Student]
    let tracks: [Track]
}

func routes(_ app: Application) throws {
    
    // CRUD Operations for students
    let studentController = StudentController()
    try app.register(collection: studentController)
    
    // CRUD Operations for tracks
    let trackController = TrackController()
    try app.register(collection: trackController)
    
    // CRUD Operations for attendances
    let attendanceController = AttendanceController()
    try app.register(collection: attendanceController)
    
    // localhost:8080/
//    app.get { req -> EventLoopFuture<View> in
//
//        let students = Student.query(on: req.db).all()
//        let tracks = Track.query(on: req.db).all()
//
//        return students.and(tracks).flatMap { (students, tracks) in
//            let context = Context(students: students, tracks: tracks)
//            return req.view.render("StudentsList", context)
//        }
//    }
    
    /*
    app.get { req async in
        "It works!"
    }
    
//     CRUD Operations: Create Read Update Delete
//     Create
//     /students POST
    app.post("students") { req -> EventLoopFuture<Student> in
        let student = try req.content.decode(Student.self) // Decode body of request to type of Student
        return student.create(on: req.db).map { student } // After create object, return the object
    }

    // Read
    // /students
    app.get("students") { req in
//        Student.query(on: req.db).all()
//        Student.query(on: req.db).with(\.$attendances).all()
        Student.query(on: req.db).with(\.$attendances).with(\.$tracks).all()
    }
    // /students/id
    app.get("students",":studentId") { req -> EventLoopFuture<Student> in
        Student.find(req.parameters.get("studentId"), on: req.db)
            .unwrap(or: Abort(.notFound)) // If not find the Id
    }

    // Update
    // /students PUT
    app.put("students") { req -> EventLoopFuture<HTTPStatus> in
        let student = try req.content.decode(Student.self) // Decode body of request to type of Student
        return Student.find(student.id, on: req.db)
            .unwrap(or: Abort(.notFound)) // If not find the Id
            .flatMap { // Update Student object property to student
                $0.name = student.name
                $0.emailAddress = student.emailAddress
                $0.referenceNumber = student.referenceNumber
                $0.nickName = student.nickName
                $0.phoneNumber = student.phoneNumber
                $0.gender = student.gender
                $0.parentName = student.parentName
                $0.parentPhoneNumber = student.parentPhoneNumber
                $0.additionalContactPhoneNumber = student.additionalContactPhoneNumber
                return $0.update(on: req.db).transform(to: .ok)
        }
    }

    // Delete
    // /students/id DELETE
    app.delete("students",":studentId") { req -> EventLoopFuture<HTTPStatus> in
        Student.find(req.parameters.get("studentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: req.db)
        }.transform(to: .ok)
    }
    
    // CRUD Operations For Track
    // Create
    // /tracks
    app.post("tracks") { req -> EventLoopFuture<Track> in
        let track = try req.content.decode(Track.self) // Decode body of request to type of Track
        return track.create(on: req.db).map { track } // After create object, return the object
    }
    
    // Read
    // /tracks
    app.get("tracks") { req in
//        Track.query(on: req.db).with(\.$attendances).all()
        Track.query(on: req.db).with(\.$attendances).with(\.$students).all()
    }
    
    // CRUD Operations For Attendance
    // Create
    // /attendances
    app.post("attendances") { req -> EventLoopFuture<Attendance> in
        let attendance = try req.content.decode(Attendance.self) // Decode body of request to type of Attendance
        return attendance.create(on: req.db).map { attendance } // After create object, return the object
    }
    
    // student/:studentId/track/:"trackId
    app.post("student",":studentId","track",":trackId") { req -> EventLoopFuture<HTTPStatus> in
        
        // get the student
        let student = Student.find(req.parameters.get("studentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
        
        // get the track
        let track = Track.find(req.parameters.get("trackId"), on: req.db)
            .unwrap(or: Abort(.notFound))
        
        return student.and(track).flatMap { (student, track) in
            student.$tracks.attach(track, on: req.db)
        }.transform(to: .ok)
        
    }
    
    // localhost:8080/
    app.get { req -> EventLoopFuture<View> in

        let students = Student.query(on: req.db).all()
        let tracks = Track.query(on: req.db).all()

        return students.and(tracks).flatMap { (students, tracks) in
            let context = Context(students: students, tracks: tracks)
            return req.view.render("StudentsList", context)
        }
    }
    
    app.get("about-us") { req -> EventLoopFuture<View> in
        req.view.render("about-us")
    }

    app.post("add-student") { req -> Response in
        let student = try req.content.decode(Student.self)
        // write the code to save the movie to the database
        print(student)
        return req.redirect(to: "/")
    }
     */
}
