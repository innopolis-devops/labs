import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        var parser = TimeParser(timeZone: .init(identifier: "America/Los_Angeles"))
        parser.dateFormat = "HH:mm:ss"
        let time = parser.getString(from: Date())
        return try await req.view.render("main", ["time": time])
    }
}
