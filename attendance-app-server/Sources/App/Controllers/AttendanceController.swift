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
                $0.day1Sessions = attendance.day1Sessions
                $0.day2Sessions = attendance.day2Sessions
                $0.day3Sessions = attendance.day3Sessions
                $0.day4Sessions = attendance.day4Sessions
                $0.day5Sessions = attendance.day5Sessions
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
