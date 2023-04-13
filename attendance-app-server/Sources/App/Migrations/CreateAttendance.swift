//
//  CreateAttendance.swift
//  
//
//  Created by Xijing Zhang on 3/16/23.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateAttendance: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("attendances")
        .id()
//        .field("track_id", .uuid, .required, .references("tracks", "id"))
//        .field("student_id", .uuid, .required, .references("students", "id"))
        .field("track_id", .uuid)
        .field("student_id", .uuid)
        .field("day1Sessions", .array(of: .json))
        .field("day2Sessions", .array(of: .json))
        .field("day3Sessions", .array(of: .json))
        .field("day4Sessions", .array(of: .json))
        .field("day5Sessions", .array(of: .json))
        .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("attendances").delete()
    }
}
