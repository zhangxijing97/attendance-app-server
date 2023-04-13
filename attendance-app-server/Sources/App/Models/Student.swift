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
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "emailAddress")
    var emailAddress: String
    
    @Field(key: "referenceNumber")
    var referenceNumber: String
    
    @Field(key: "nickName")
    var nickName: String
    
    @Field(key: "phoneNumber")
    var phoneNumber: String
    
    @Field(key: "gender")
    var gender: String
    
    @Field(key: "parentName")
    var parentName: String
    
    @Field(key: "parentPhoneNumber")
    var parentPhoneNumber: String
    
    @Field(key: "additionalContactPhoneNumber")
    var additionalContactPhoneNumber: String
    
    /*
    // hasMany - Student has many attendances
    @Children(for: \.$student)
    var attendances: [Attendance]
    
    @Siblings(through: Attendance.self, from: \.$student, to: \.$track)
    var tracks: [Track]
    */
    
    init() {}
    
    init(id: UUID? = nil, name: String, emailAddress: String, referenceNumber: String, nickName: String, phoneNumber: String, gender: String, parentName: String, parentPhoneNumber: String, additionalContactPhoneNumber: String) {
        self.id = id
        self.name = name
        self.emailAddress = emailAddress
        self.referenceNumber = referenceNumber
        self.nickName = nickName
        self.phoneNumber = phoneNumber
        self.gender = gender
        self.parentName = parentName
        self.parentPhoneNumber = parentPhoneNumber
        self.additionalContactPhoneNumber = additionalContactPhoneNumber
    }
}

