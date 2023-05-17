//
//  Session.swift
//  
//
//  Created by Xijing Zhang on 4/5/23.
//

import Fluent
import Vapor
import FluentPostgresDriver

final class Session: Model, Content {
    
    static let schema = "sessions"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "track_id")
    var track_id: UUID?
    
    @Field(key: "date")
    var date: Date
    
    @Field(key: "sessionNumber")
    var sessionNumber: String
    
    @Field(key: "startTime")
    var startTime: Date
    
    @Field(key: "endTime")
    var endTime: Date
    
    init() {}
    
    init(id: UUID? = nil, track_id: UUID, date: Date, checkInTime: Date, startTime: Date, endTime: Date) {
        self.id = id
        self.track_id = track_id
        self.date = date
        self.sessionNumber = sessionNumber
        self.startTime = startTime
        self.endTime = endTime
    }
}
