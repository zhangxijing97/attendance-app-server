//
//  Student.swift
//
//
//  Created by Xijing Zhang on 3/16/23.
//

import Fluent
import Vapor

final class Student: Model, Content {
    static let schema = "students" // table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "referenceNumber")
    var referenceNumber: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "gender")
    var gender: String
    
    @Field(key: "emailAddress")
    var emailAddress: String

    @Field(key: "phoneNumber")
    var phoneNumber: String
    
    @Field(key: "parentName")
    var parentName: String
    
    @Field(key: "parentPhoneNumber")
    var parentPhoneNumber: String
    
    @Field(key: "additionalContactPhoneNumber")
    var additionalContactPhoneNumber: String
    
    init() {}
    
    init(id: UUID? = nil, referenceNumber: String, name: String, gender: String, emailAddress: String, phoneNumber: String, parentName: String, parentPhoneNumber: String, additionalContactPhoneNumber: String) {
        self.id = id
        self.referenceNumber = referenceNumber
        self.name = name
        self.gender = gender
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.parentName = parentName
        self.parentPhoneNumber = parentPhoneNumber
        self.additionalContactPhoneNumber = additionalContactPhoneNumber
    }
}

