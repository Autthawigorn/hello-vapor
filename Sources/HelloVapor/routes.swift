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
    
    //http://127.0.0.1:8080/movies
    app.get("movies") { req async -> String in
        "Movies"
    }
    
    //movies/action
    //movies/dummy
    app.get("movies", ":genre") { req async -> String in
        "Action Movies"
    }
}
