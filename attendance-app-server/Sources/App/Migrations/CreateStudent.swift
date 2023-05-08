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
//        .field("referenceNumber", .string)
//        .field("name", .string)
//        .field("gender", .string)
//        .field("emailAddress", .string)
//        .field("phoneNumber", .string)
//        .field("parentName", .string)
//        .field("parentPhoneNumber", .string)
//        .field("additionalContactPhoneNumber", .string)
        
        .field("referenceNumber", .string)
        .field("firstName", .string)
        .field("lastName", .string)
        .field("nickName", .string)
        .field("gender", .string)
        .field("pronouns", .string)
        .field("gradeEntering", .string)
        
        .field("emailAddress", .string)
        .field("phoneNumber", .string)
        .field("parentName", .string)
        .field("parentPhoneNumber", .string)
        .field("emergencyContactName1", .string)
        .field("emergencyContactPhone1", .string)
        .field("emergencyContactName2", .string)
        .field("emergencyContactPhone2", .string)
        
        .field("checkoutPolicy", .string)
        .field("other", .string)
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("students").delete() // drop the table
    }
}
