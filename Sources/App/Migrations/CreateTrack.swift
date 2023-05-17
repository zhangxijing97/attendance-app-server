//
//  File.swift
//  
//
//  Created by Xijing Zhang on 3/16/23.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateTrack: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("tracks") // table name
        .id()
        .field("name", .string)
        .field("level", .string)
        .field("location", .string)
        .field("startDate", .date)
        .field("endDate", .date)
        .field("sessions", .array(of: .string))
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("tracks").delete() // drop the table
    }
}
