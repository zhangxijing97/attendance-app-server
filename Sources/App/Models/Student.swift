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

    @Field(key: "firstName")
    var firstName: String
    
    @Field(key: "lastName")
    var lastName: String
    
    @Field(key: "nickName")
    var nickName: String

    @Field(key: "gender")
    var gender: String
    
    @Field(key: "pronouns")
    var pronouns: String
    
    @Field(key: "gradeEntering")
    var gradeEntering: String
    

    @Field(key: "emailAddress")
    var emailAddress: String

    @Field(key: "phoneNumber")
    var phoneNumber: String

    @Field(key: "parentName")
    var parentName: String

    @Field(key: "parentPhoneNumber")
    var parentPhoneNumber: String

    @Field(key: "emergencyContactName1")
    var emergencyContactName1: String

    @Field(key: "emergencyContactPhone1")
    var emergencyContactPhone1: String
    
    @Field(key: "emergencyContactName2")
    var emergencyContactName2: String

    @Field(key: "emergencyContactPhone2")
    var emergencyContactPhone2: String
    
    
    @Field(key: "checkoutPolicy")
    var checkoutPolicy: String
    
    @Field(key: "other")
    var other: String

    init() {}

    init(id: UUID? = nil, referenceNumber: String, firstName: String, lastName: String, nickName: String, gender: String, pronouns: String, gradeEntering: String, emailAddress: String, phoneNumber: String, parentName: String, parentPhoneNumber: String, emergencyContactName1: String, emergencyContactPhone1: String, emergencyContactName2: String, emergencyContactPhone2: String, checkoutPolicy: String, other: String) {
        self.id = id
        self.referenceNumber = referenceNumber
        self.firstName = firstName
        self.lastName = lastName
        self.nickName = nickName
        self.gender = gender
        self.pronouns = pronouns
        self.gradeEntering = gradeEntering
        
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.parentName = parentName
        self.parentPhoneNumber = parentPhoneNumber
        self.emergencyContactName1 = emergencyContactName1
        self.emergencyContactPhone1 = emergencyContactPhone1
        self.emergencyContactName2 = emergencyContactName2
        self.emergencyContactPhone2 = emergencyContactPhone2
        
        self.checkoutPolicy = checkoutPolicy
        self.other = other
    }
}

//final class Student: Model, Content {
//    static let schema = "students" // table name
//
//    @ID(key: .id)
//    var id: UUID?
//
//    @Field(key: "referenceNumber")
//    var referenceNumber: String
//
//    @Field(key: "name")
//    var name: String
//
//    @Field(key: "gender")
//    var gender: String
//
//    @Field(key: "emailAddress")
//    var emailAddress: String
//
//    @Field(key: "phoneNumber")
//    var phoneNumber: String
//
//    @Field(key: "parentName")
//    var parentName: String
//
//    @Field(key: "parentPhoneNumber")
//    var parentPhoneNumber: String
//
//    @Field(key: "additionalContactPhoneNumber")
//    var additionalContactPhoneNumber: String
//
//    init() {}
//
//    init(id: UUID? = nil, referenceNumber: String, name: String, gender: String, emailAddress: String, phoneNumber: String, parentName: String, parentPhoneNumber: String, additionalContactPhoneNumber: String) {
//        self.id = id
//        self.referenceNumber = referenceNumber
//        self.name = name
//        self.gender = gender
//        self.emailAddress = emailAddress
//        self.phoneNumber = phoneNumber
//        self.parentName = parentName
//        self.parentPhoneNumber = parentPhoneNumber
//        self.additionalContactPhoneNumber = additionalContactPhoneNumber
//    }
//}

