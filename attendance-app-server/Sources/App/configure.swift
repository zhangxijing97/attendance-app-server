import Vapor
import Fluent
import FluentPostgresDriver
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)

    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "attendancedb"), as: .psql)

    app.migrations.add(CreateStudent())
    app.migrations.add(CreateTrack())
    app.migrations.add(CreateAttendance())
    
    app.http.server.configuration.hostname = "0.0.0.0"
//    app.http.server.configuration.port = 8000
    
    // register routes
    try routes(app)
}

