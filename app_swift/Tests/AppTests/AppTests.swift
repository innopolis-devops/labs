@testable import App
import XCTVapor


final class AppTests: XCTestCase {

    public static var app: Application!

    override class func setUp() {
        app = Application(.testing)
        try! configure(app)
    }

    override class func tearDown() {
        app.shutdown()
    }

    func test_homepageStatusCode() throws {

        try Self.app.test(.GET, "", afterResponse: { res in
            XCTAssertTrue(res.status == .ok)
        })

    }

    func test_responseContent() throws {

        try Self.app.test(.GET, "", afterResponse: { res in
            XCTAssertTrue(res.body.string.lowercased().contains("weekday"))
        })

    }
}
