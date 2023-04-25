//
//  File.swift
//  
//
//  Created by 张熙景 on 4/2/23.
//

import Foundation
import Vapor

struct TrackStudentController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let trackstudentsRoutes = routes.grouped("trackstudents")
        trackstudentsRoutes.post(use: create)
        trackstudentsRoutes.get(use: read)
        trackstudentsRoutes.get(":trackstudentId", use: readTrackStudent)
        trackstudentsRoutes.put(use: update)
        trackstudentsRoutes.delete(":trackstudentId", use: delete)
    }

    func create(req: Request) throws -> EventLoopFuture<TrackStudent> {
        let trackstudent = try req.content.decode(TrackStudent.self)
        return trackstudent.create(on: req.db).map { trackstudent }
    }

    func read(req: Request) throws -> EventLoopFuture<[TrackStudent]> {
        return TrackStudent.query(on: req.db).all()
    }

    func readTrackStudent(req: Request) throws -> EventLoopFuture<TrackStudent> {
        return TrackStudent.find(req.parameters.get("trackstudentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let trackstudent = try req.content.decode(TrackStudent.self)
        return TrackStudent.find(trackstudent.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.track_id = trackstudent.track_id
                $0.student_id = trackstudent.student_id
                return $0.update(on: req.db).transform(to: .ok)
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return TrackStudent.find(req.parameters.get("trackstudentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
}

