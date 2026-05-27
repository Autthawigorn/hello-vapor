//
//  File.swift
//  HelloVapor
//
//  Created by Art Mac M5 on 26/5/2569 BE.
//

import Foundation
import Vapor

struct MovieController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        
        // /Movies
        movies.get(use: getAllHandler)
        
        // /Movies/23
        movies.get(":movieId", use: showId)
        
    }

    func getAllHandler(_ req: Request) throws -> String {
        return "Index"
    }
    
    func showId(_ req: Request) throws -> String {
        guard let movieId = req.parameters.get("movieId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "Show \(movieId)"
    }
}
