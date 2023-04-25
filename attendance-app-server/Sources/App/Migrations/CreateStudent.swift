//
//  CreateStudent.swift
//  
//
//  Created by Xijing Zhang on 3/16/23.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateStudent: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("students") // table name
        .id()
        .field("referenceNumber", .string)
        .field("name", .string)
        .field("gender", .string)
        .field("emailAddress", .string)
        .field("phoneNumber", .string)
        .field("parentName", .string)
        .field("parentPhoneNumber", .string)
        .field("additionalContactPhoneNumber", .string)
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("students").delete() // drop the table
    }
}
