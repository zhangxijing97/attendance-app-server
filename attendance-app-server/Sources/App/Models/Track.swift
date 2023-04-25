//
//  Track.swift
//  
//
//  Created by Xijing Zhang on 3/24/23.
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
    
    @Field(key: "startDate")
    var startDate: Date
    
    @Field(key: "endDate")
    var endDate: Date
    
    @Field(key: "sessions")
    var sessions: [String]

    init() {}
    
    init(id: UUID? = nil, name: String, level: String, location: String, startDate: Date, endDate: Date, sessions: [String]) {
        self.id = id
        self.name = name
        self.level = level
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
        self.sessions = sessions
    }
}
