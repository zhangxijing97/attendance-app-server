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
    
    @Field(key: "trackstudent_id")
    var trackstudent_id: UUID?
    
    @Field(key: "date")
    var date: Date
    
    @Field(key: "sessionNumber")
    var sessionNumber: String
    
    @Field(key: "checkInTime")
    var checkInTime: Date
    
    @Field(key: "checkOutTime")
    var checkOutTime: Date
    
    init() {}
    
    init(id: UUID? = nil, trackstudent_id: UUID, date: Date, sessionNumber: String, checkInTime: Date, checkOutTime: Date) {
        self.id = id
        self.trackstudent_id = trackstudent_id
        self.date = date
        self.sessionNumber = sessionNumber
        self.checkInTime = checkInTime
        self.checkOutTime = checkOutTime
    }
}
