import Vapor

func routes(_ app: Application) throws {
 
    app.middleware.use(LogMiddleware())
    app.middleware.use(AuthenticationMiddleWare())
    
    //members
    app.grouped(AuthenticationMiddleWare()).group("members") {route in
        route.get { req async -> String in
            "Hey!!! Member Inder"
        }
        
        route.get("hello") { req async -> String in
            "Hello World!!! Member"
        }
    }
    
    
    // /
    app.get { req async in
     "It works!"
    }
    
    // /hello
    app.get("hello") { req async -> String in
        "Hello World!"
    }

}
