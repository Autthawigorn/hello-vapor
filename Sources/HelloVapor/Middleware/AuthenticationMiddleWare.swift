//
//  File.swift
//  HelloVapor
//
//  Created by Art's Mac M1 on 5/28/26.
//

import Foundation
import Vapor

struct AuthenticationMiddleWare: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        // Header: Authorization: Bearer EDJ392039103493049
        guard let authorization = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        print(authorization.token)
        return try await next.respond(to: request)
       
    }
}

