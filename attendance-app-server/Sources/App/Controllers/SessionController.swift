//
//  File.swift
//  
//
//  Created by 张熙景 on 4/5/23.
//

import Foundation
import Vapor

struct SessionController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let sessionsRoutes = routes.grouped("sessions")
        sessionsRoutes.post(use: create)
        sessionsRoutes.get(use: read)
        sessionsRoutes.get(":sessionId", use: readSession)
        sessionsRoutes.put(use: update)
        sessionsRoutes.delete(":sessionId", use: delete)
    }

    func create(req: Request) throws -> EventLoopFuture<Session> {
        let session = try req.content.decode(Session.self)
        return session.create(on: req.db).map { session }
    }

    func read(req: Request) throws -> EventLoopFuture<[Session]> {
        return Session.query(on: req.db).all()
    }

    func readSession(req: Request) throws -> EventLoopFuture<Session> {
        return Session.find(req.parameters.get("sessionId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let session = try req.content.decode(Session.self)
        return Session.find(session.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.date = session.date
                $0.startTime = session.startTime
                $0.endTime = session.endTime
                return $0.update(on: req.db).transform(to: .ok)
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Session.find(req.parameters.get("sessionId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
}
