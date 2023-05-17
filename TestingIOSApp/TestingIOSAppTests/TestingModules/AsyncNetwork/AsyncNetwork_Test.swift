//
//  AsyncNetwork_Test.swift
//  TestingIOSAppTests
//
//  Created by Aarón Alberto Martínez Cuevas on 17/05/23.
//

import XCTest
@testable import TestingIOSApp

final class AsyncNetworkTest: XCTestCase {
    
    let sut: AsyncNetworkCall = AsyncNetworkCall()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let response = try await sut.executeQuery(endpoint: "https://jsonplaceholder.typicode.com/todos", type: [JSONPlaceHolderTodos].self)
        dump(response)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

struct JSONPlaceHolderTodos: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
