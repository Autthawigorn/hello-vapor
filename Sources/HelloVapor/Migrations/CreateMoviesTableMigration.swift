import Fluent

struct CreateMoviesTableMigration: AsyncMigration {
    func prepare(on database: any Database) async throws {
        // create vovies table
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }

    //undo migration
    func revert(on database: any Database) async throws {
        // delete movie table
        try await database.schema("movies").delete()
    }
}
