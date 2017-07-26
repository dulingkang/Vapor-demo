import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            let name = req.data["name"]?.string ?? "vapor"
            return "\(name)"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        post("postName") { req in
            let name = req.data["name"]?.string ?? "vapor"
            return "\(name)"
        }
        post("upload") { req in
            let name0 = req.data["data0"]?.string ?? "vapor"
            let name1 = req.data["data1"]?.string ?? "vapor"
            return name0 + name1
        }
        
        try resource("posts", PostController.self)
    }
}
