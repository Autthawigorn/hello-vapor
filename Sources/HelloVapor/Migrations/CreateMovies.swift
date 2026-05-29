import Fluent

struct CreateMovies: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("movies").delete()
    }
}
