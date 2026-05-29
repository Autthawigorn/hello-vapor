import Vapor

func routes(_ app: Application) throws {
    
    // create movie
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movies.self)
        try await movie.save(on: req.db)
        return movie
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
