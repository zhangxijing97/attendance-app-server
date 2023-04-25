//
//  File.swift
//  
//
//  Created by 张熙景 on 3/15/23.
//

import Foundation
import Vapor

struct TrackController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let tracksRoutes = routes.grouped("tracks")
        tracksRoutes.post(use: create)
        tracksRoutes.get(use: read)
        tracksRoutes.get(":trackId", use: readTrack)
        tracksRoutes.put(use: update)
        tracksRoutes.delete(":trackId", use: delete)
    }

    func create(req: Request) throws -> EventLoopFuture<Track> {
        let track = try req.content.decode(Track.self)
        return track.create(on: req.db).map { track }
    }

    func read(req: Request) throws -> EventLoopFuture<[Track]> {
//        return Track.query(on: req.db).with(\.$attendances).with(\.$students).all()
        return Track.query(on: req.db).all()
    }

    func readTrack(req: Request) throws -> EventLoopFuture<Track> {
        return Track.find(req.parameters.get("trackId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let track = try req.content.decode(Track.self)
        return Track.find(track.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.name = track.name
                $0.level = track.level
                $0.location = track.location
                $0.startDate = track.startDate
                $0.endDate = track.endDate
                $0.sessions = track.sessions
                return $0.update(on: req.db).transform(to: .ok)
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Track.find(req.parameters.get("trackId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.delete(on: req.db)
            }.transform(to: .ok)
    }
}
