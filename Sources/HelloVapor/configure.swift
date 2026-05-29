import Vapor
import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) async throws {
    if let databaseURL = Environment.get("DATABASE_URL") {
        try app.databases.use(.postgres(url: databaseURL), as: .psql)
    }

    try routes(app)
}
