import Vapor

func routes(_ app: Application) throws {
 
    app.middleware.use(LogMiddleware())
    
    // /
    app.get { req async in
     "It works!"
    }
    
    // /hello
    app.get("hello") { req async -> String in
        "Hello World!"
    }

}
