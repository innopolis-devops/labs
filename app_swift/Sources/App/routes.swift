import Vapor


public struct Weekday {


    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()

    public static func string(for date: Date) -> String {
        return dateFormatter.string(from: date)
    }

    public static var current: String {
        return Weekday.string(for: Date())
    }

}


func routes(_ app: Application) throws {

    app.get { req async throws in
        try await req.view.render("index", ["time": Weekday.current])
    }

}
