//
//  File.swift
//  HelloVapor
//
//  Created by Art Mac M5 on 26/5/2569 BE.
//

import Foundation
import Vapor

struct MovieController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        movies.get(use: getAllHandler)
    }
    
    func getAllHandler(_ req: Request) throws -> EventLoopFuture<[Movie]> {
        return Movie.query(on: req.application.server.self).all()
    }
}
