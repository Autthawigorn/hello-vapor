import Vapor

func routes(_ app: Application) throws {
    
    // create movie
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movies.self)
        try await movie.save(on: req.db)
        return movie
    }
    
    // get all movies
    app.get("movies") { req async throws in
      try await Movies.query(on: req.db)
            .all()
    }
    
    // get movie by id
    app.get("movies", ":id" ) { req async throws in
        guard let movie = try await Movies.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return movie
        
    }
    
    // delete a movie
    app.delete("movies", ":id") { req async throws in
        guard let movie = try await Movies.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.badRequest)
        }
        
        try await movie.delete(on: req.db)
        return movie
    }
    
    // update a movie
//    app.put("movies") { req async throws in
//       let movie = try req.content.decode(Movies.self)
//        
//        guard let movieToUpdate = try await Movies.find(movie.id, on: req.db) else {
//            throw Abort(.notFound)
//        }
//        
//        movieToUpdate.title = movie.title
//        
//        try await movieToUpdate.update(on: req.db)
//        return movieToUpdate
//    }
    
    app.put("movies") { req async throws in
           let movie = try req.content.decode(Movies.self)
            
        guard let movieToUpdate = try await Movies.find(movie.id, on: req.db) else {
                throw Abort(.notFound)
            }
            
            movieToUpdate.title = movie.title
            
            try await movieToUpdate.update(on: req.db)
            return movieToUpdate
        }

 
//    app.middleware.use(LogMiddleware())
//    app.middleware.use(AuthenticationMiddleWare())
//    
//    //members
//    app.grouped(AuthenticationMiddleWare()).group("members") {route in
//        route.get { req async -> String in
//            "Hey!!! Member Inder"
//        }
//        
//        route.get("hello") { req async -> String in
//            "Hello World!!! Member"
//        }
//    }
    
    
    // /
    app.get { req async in
     "It works!"
    }
    
    // /hello
    app.get("hello") { req async -> String in
        "Hello World!"
    }

}
