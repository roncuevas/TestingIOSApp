import Cocoa
import Foundation
import Combine

var greeting = "Hello, playground"

struct TestPublishers {
    let email = ""
    let hola = ""
    let jeje = ""
}

let myPublisher = Just(TestPublishers())
let cancellables = myPublisher.sink { value in
    print(value)
}
