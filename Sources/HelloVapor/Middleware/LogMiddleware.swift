//
//  File.swift
//  HelloVapor
//
//  Created by Art Mac M5 on 27/5/2569 BE.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to req: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        print("LogMiddleware")
        return try await next.respond(to: req)
    }
}
