import Vapor
import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) async throws {
    if let databaseURL = Environment.get("DATABASE_URL") {
        try app.databases.use(.postgres(url: databaseURL), as: .psql)
    } else {
        app.databases.use(.postgres(configuration: .init(
            hostname: "localhost",
            username: "postgres",
            password: "",
            database: "grocerydb",
            tls: .disable
        )), as: .psql)
    }

    app.migrations.add(CreateMoviesTableMigration())
    try await app.autoMigrate()

    try routes(app)
}

/*
======= RENDER ========

ช่อง NAME_OF_VARIABLE ใส่:
DATABASE_URL

ช่อง value ใส่ connection string จาก Neon:
postgresql://user:pass@ep-xxx.neon.tech/neondb?sslmode=require
*/
