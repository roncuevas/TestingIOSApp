import Foundation

extension RandomUserModel {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

extension Data {
    func toRandomUser() -> RandomUserModel? {
        return try? JSONDecoder().decode(RandomUserModel.self, from: self)
    }
}
