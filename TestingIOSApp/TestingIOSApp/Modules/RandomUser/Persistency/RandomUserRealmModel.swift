//
//  RandomUserRealmModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 13/04/23.
//

import Foundation
import RealmSwift

// MARK: - Result
class RandomUserRealmModel: Object {
    @Persisted var gender: String
    @Persisted var name: String
    @Persisted var email: String
    @Persisted var phone: String
    @Persisted var large: String
    @Persisted var response: Data?
    
    convenience init(gender: String, name: String, email: String, phone: String, large: String, response: Data?) {
        self.init()
        self.gender = gender
        self.name = name
        self.email = email
        self.phone = phone
        self.large = large
        self.response = response
    }
}
