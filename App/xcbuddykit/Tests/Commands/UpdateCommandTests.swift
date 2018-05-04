import Foundation
import Utility
@testable import xcbuddykit
import XCTest

final class UpdateCommandTests: XCTestCase {
    var updateController: MockUpdateController!
    var subject: UpdateCommand!
    var context: CommandsContexting!

    override func setUp() {
        super.setUp()
        updateController = MockUpdateController()
        context = CommandsContext()
        subject = UpdateCommand(controller: updateController,
                                context: context)
    }

    func test_command() {
        XCTAssertEqual(subject.command, "update")
    }

    func test_overview() {
        XCTAssertEqual(subject.overview, "Updates the app.")
    }

    func test_run() throws {
        let result = ArgumentParser.Result.test()
        subject.run(with: result)
        XCTAssertEqual(updateController.checkAndUpdateFromConsoleCount, 1)
    }
}
