//
//  CreateTrackStuden.swift
//  
//
//  Created by Xijing Zhang on 3/16/23.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateTrackStudent: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("trackstudents")
        .id()
        .field("track_id", .uuid)
        .field("student_id", .uuid)
        .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("trackstudents").delete()
    }
}
