//
//  File.swift
//  HelloVapor
//
//  Created by Art's Mac M1 on 5/25/26.
//

import Foundation
import Fluent
import Vapor

final class Movies: Model, Content, @unchecked Sendable {
    
    static let schema: String = "movies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
