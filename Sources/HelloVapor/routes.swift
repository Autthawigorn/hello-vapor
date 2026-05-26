import Vapor

func routes(_ app: Application) throws {
    //http://127.0.0.1:8080
    app.get { req async in
        "It works!"
    }
    
    //http://127.0.0.1:8080/hello
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.post("movies") {req async throws in
        let movie = try req.content.decode(Movies.self)
        return movie
    }
    
    
    app.get("customers", ":customerId") { req async throws -> String in
        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(customerId)"
    }
    
    //http://127.0.0.1:8080/movies
    app.get("movies") { req async -> [Movies] in
        [Movies(title: "Dummy1", year: 2020), Movies(title: "Dummy2", year: 2020), Movies(title: "Dummy3", year: 1984)]
        }
    
    ///route parameters/ dynamic parameter
    //movies/action
    //movies/dummy
    app.get("movies", ":genre") { req async throws -> String in
        guard let genre = req.parameters.get("genre") else {
            throw Abort(.badRequest)
        }
        return "Movies for \(genre)"
    }
    
    app.get("movies", ":genre", ":year") { req async throws -> String in
        guard let genre = req.parameters.get("genre"),
              let year = req.parameters.get("year")
        else {
            throw Abort(.badRequest)
        }
        return "All movies of \(genre) from \(year)"
    }
}
