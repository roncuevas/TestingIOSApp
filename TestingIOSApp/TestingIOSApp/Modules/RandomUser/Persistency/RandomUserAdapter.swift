//
//  RandomUserAdapter.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 15/04/23.
//

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
