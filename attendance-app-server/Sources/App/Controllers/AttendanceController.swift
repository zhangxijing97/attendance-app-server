//
//  File.swift
//  
//
//  Created by 张熙景 on 3/27/23.
//

import Foundation
import Vapor

struct AttendanceController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let attendancesRoutes = routes.grouped("attendances")
        attendancesRoutes.post(use: create)
        attendancesRoutes.get(use: read)
        attendancesRoutes.get(":attendanceId", use: readAttendance)
        attendancesRoutes.put(use: update)
        attendancesRoutes.delete(":attendanceId", use: delete)
    }

    func create(req: Request) throws -> EventLoopFuture<Attendance> {
        let attendance = try req.content.decode(Attendance.self)
        return attendance.create(on: req.db).map { attendance }
    }

    func read(req: Request) throws -> EventLoopFuture<[Attendance]> {
        return Attendance.query(on: req.db).all()
    }

    func readAttendance(req: Request) throws -> EventLoopFuture<Attendance> {
        return Attendance.find(req.parameters.get("attendanceId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let attendance = try req.content.decode(Attendance.self)
        return Attendance.find(attendance.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.trackstudent_id = attendance.trackstudent_id
                $0.date = attendance.date
                $0.sessionNumber = attendance.sessionNumber
                $0.checkInTime = attendance.checkInTime
                $0.checkOutTime = attendance.checkOutTime
                return $0.update(on: req.db).transform(to: .ok)
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Attendance.find(req.parameters.get("attendanceId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
}
