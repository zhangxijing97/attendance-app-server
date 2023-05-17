//
//  TrackStudent.swift
//
//
//  Created by Xijing Zhang on 3/24/23.
//

import Fluent
import Vapor
import FluentPostgresDriver

final class TrackStudent: Model, Content {
    
    static let schema = "trackstudents"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "track_id")
    var track_id: UUID?
    
    @Field(key: "student_id")
    var student_id: UUID?
    
    init() {}
    
    init(id: UUID? = nil, track_id: UUID, student_id: UUID) {
        self.id = id
        self.track_id = track_id
        self.student_id = student_id
    }
}
