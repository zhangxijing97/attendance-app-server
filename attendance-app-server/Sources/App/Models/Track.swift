//
//  File.swift
//  
//
//  Created by 张熙景 on 3/24/23.
//

import Fluent
import Vapor

final class Track: Model, Content {
    static let schema = "tracks" // table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "level")
    var level: String
    
    @Field(key: "location")
    var location: String
    
    @Field(key: "date")
    var date: String
    
    @Field(key: "days")
    var days: [String]
    
    @Field(key: "sessions")
    var sessions: [String]
    
    /*
    // hasMany - Student has many attendances
    @Children(for: \.$track)
    var attendances: [Attendance]
    
    @Siblings(through: Attendance.self, from: \.$track, to: \.$student)
    var students: [Student]
    */
    
    init() {}
    
    init(id: UUID? = nil, name: String, level: String, location: String, date: String, days: [String], sessions: [String]) {
        self.id = id
        self.name = name
        self.level = level
        self.location = location
        self.date = date
        self.days = days
        self.sessions = sessions
    }
}
