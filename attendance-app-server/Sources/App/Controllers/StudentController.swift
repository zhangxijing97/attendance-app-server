//
//  StudentController.swift
//  
//
//  Created by 张熙景 on 3/15/23.
//

import Foundation
import Vapor

struct StudentController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let studentsRoutes = routes.grouped("students")
        studentsRoutes.post(use: create)
        studentsRoutes.get(use: read)
        studentsRoutes.get(":studentId", use: readStudent)
        studentsRoutes.put(use: update)
        studentsRoutes.delete(":studentId", use: delete)
    }

    func create(req: Request) throws -> EventLoopFuture<Student> {
        let student = try req.content.decode(Student.self)
        return student.create(on: req.db).map { student }
    }

    func read(req: Request) throws -> EventLoopFuture<[Student]> {
//        return Student.query(on: req.db).with(\.$attendances).with(\.$tracks).all()
        return Student.query(on: req.db).all()
    }

    func readStudent(req: Request) throws -> EventLoopFuture<Student> {
        return Student.find(req.parameters.get("studentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let student = try req.content.decode(Student.self)
        return Student.find(student.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.referenceNumber = student.referenceNumber
                $0.firstName = student.firstName
                $0.lastName = student.lastName
                $0.nickName = student.nickName
                $0.gender = student.gender
                $0.pronouns = student.pronouns
                $0.gradeEntering = student.gradeEntering
                
                $0.emailAddress = student.emailAddress
                $0.phoneNumber = student.phoneNumber
                $0.parentName = student.parentName
                $0.parentPhoneNumber = student.parentPhoneNumber
                $0.emergencyContactName1 = student.emergencyContactName1
                $0.emergencyContactPhone1 = student.emergencyContactPhone1
                $0.emergencyContactName2 = student.emergencyContactName2
                $0.emergencyContactPhone2 = student.emergencyContactPhone2
                
                $0.checkoutPolicy = student.checkoutPolicy
                $0.other = student.other
                return $0.update(on: req.db).transform(to: .ok)
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Student.find(req.parameters.get("studentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
}
