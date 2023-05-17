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
        .field("trackstudent_id", .uuid)
        .field("date", .date)
        .field("sessionNumber", .string)
        .field("checkInTime", .datetime)
        .field("checkOutTime", .datetime)
        .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("attendances").delete()
    }
}
