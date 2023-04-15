//
//  RandomUserRealmModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 13/04/23.
//

import Foundation
import RealmSwift

// MARK: - Welcome
class RandomUserRealmModel: Object {
    @Persisted var results: List<RandomUserRealmResult> = List<RandomUserRealmResult>()
    @Persisted var info: RandomUserRealmInfo
}

// MARK: - Info
class RandomUserRealmInfo: Object {
    @Persisted var seed: String
    @Persisted var results: Int
    @Persisted var page: Int
    @Persisted var version: String
}

// MARK: - Result
class RandomUserRealmResult: Object {
    @Persisted var gender: String
    @Persisted var name: RandomUserRealmName
    @Persisted var location: RandomUserRealmLocation
    @Persisted var email: String
    @Persisted var login: RandomUserRealmLogin
    @Persisted var dob: RandomUserRealmDob
    @Persisted var registered: RandomUserRealmDob
    @Persisted var phone: String
    @Persisted var cell: String
    @Persisted var id: RandomUserRealmID
    @Persisted var picture: RandomUserRealmPicture
    @Persisted var nat: String
}

// MARK: - Dob
class RandomUserRealmDob: Object {
    @Persisted var date: String
    @Persisted var age: Int
}

// MARK: - ID
class RandomUserRealmID: Object {
    @Persisted var name: String
    @Persisted var value: String?
}

// MARK: - Location
class RandomUserRealmLocation: Object {
    @Persisted var street: RandomUserRealmStreet
    @Persisted var city: String
    @Persisted var state: String
    @Persisted var country: String
    @Persisted var postcode: Int?
    @Persisted var coordinates: RandomUserRealmCoordinates
    @Persisted var timezone: RandomUserRealmTimezone
}

// MARK: - Coordinates
class RandomUserRealmCoordinates: Object {
    @Persisted var latitude: String
    @Persisted var longitude: String
}

// MARK: - Street
class RandomUserRealmStreet: Object {
    @Persisted var number: Int
    @Persisted var name: String
}

// MARK: - Timezone
class RandomUserRealmTimezone: Object {
    @Persisted var offset: String
    @Persisted var descripcion: String
}

// MARK: - Login
class RandomUserRealmLogin: Object {
    @Persisted var uuid: String
    @Persisted var username: String
    @Persisted var password: String
    @Persisted var salt: String
    @Persisted var md5: String
    @Persisted var sha1: String
    @Persisted var sha256: String
}

// MARK: - Name
class RandomUserRealmName: Object {
    @Persisted var title: String
    @Persisted var first: String
    @Persisted var last: String
}

// MARK: - Picture
class RandomUserRealmPicture: Object {
    @Persisted var large: String
    @Persisted var medium: String
    @Persisted var thumbnail: String
}
