//
//  Attendance.swift
//
//
//  Created by Xijing Zhang on 3/16/23.
//

import Fluent
import Vapor
import FluentPostgresDriver

final class Attendance: Model, Content {
    
    static let schema = "attendances"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "track_id")
    var track_id: UUID?
    
    @Field(key: "student_id")
    var student_id: UUID?
    
//    @Parent(key: "track_id")
//    var track: Track
//
//    @Parent(key: "student_id")
//    var student: Student
    
    @Field(key: "day1Sessions")
    var day1Sessions: [Session]
    
    @Field(key: "day2Sessions")
    var day2Sessions: [Session]
    
    @Field(key: "day3Sessions")
    var day3Sessions: [Session]
    
    @Field(key: "day4Sessions")
    var day4Sessions: [Session]
    
    @Field(key: "day5Sessions")
    var day5Sessions: [Session]
    
    init() {}
    
    init(id: UUID? = nil, track_id: UUID, student_id: UUID, day1Sessions: [Session], day2Sessions: [Session], day3Sessions: [Session], day4Sessions: [Session], day5Sessions: [Session]) {
        self.id = id
//        self.$track.id = trackId
//        self.$student.id = studentId
        self.track_id = track_id
        self.student_id = student_id
        self.day1Sessions = day1Sessions
        self.day2Sessions = day2Sessions
        self.day3Sessions = day3Sessions
        self.day4Sessions = day4Sessions
        self.day5Sessions = day5Sessions
    }
}

struct Session: Codable {
    var checkInTime: Date
    var checkOutTime: Date
}
