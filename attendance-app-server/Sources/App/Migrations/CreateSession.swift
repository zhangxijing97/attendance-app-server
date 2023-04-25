//
//  File.swift
//  
//
//  Created by 张熙景 on 4/5/23.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateSession: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("sessions")
        .id()
        .field("track_id", .uuid)
        .field("date", .date)
        .field("sessionNumber", .string)
        .field("startTime", .datetime)
        .field("endTime", .datetime)
        .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("sessions").delete()
    }
}
