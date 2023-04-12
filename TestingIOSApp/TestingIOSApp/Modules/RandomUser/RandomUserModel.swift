//
//  RandomUserModel.swift
//  iOS_Testing
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct RandomUserModel: Codable {
    let results: [RandomUserResult]
    let info: RandomUserInfo
}

// MARK: - Info
struct RandomUserInfo: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct RandomUserResult: Codable {
    let gender: String
    let name: RandomUserName
    let location: RandomUserLocation
    let email: String
    let login: RandomUserLogin
    let dob, registered: RandomUserDob
    let phone, cell: String
    let id: RandomUserID
    let picture: RandomUserPicture
    let nat: String
}

// MARK: - Dob
struct RandomUserDob: Codable {
    let date: String
    let age: Int
}

// MARK: - ID
struct RandomUserID: Codable {
    let name: String
    let value: String?
}

// MARK: - Location
struct RandomUserLocation: Codable {
    let street: RandomUserStreet
    let city, state, country: String
    let postcode: Int?
    let coordinates: RandomUserCoordinates
    let timezone: RandomUserTimezone
}

// MARK: - Coordinates
struct RandomUserCoordinates: Codable {
    let latitude, longitude: String
}

// MARK: - Street
struct RandomUserStreet: Codable {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct RandomUserTimezone: Codable {
    let offset, description: String
}

// MARK: - Login
struct RandomUserLogin: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct RandomUserName: Codable {
    let title, first, last: String
}

// MARK: - Picture
struct RandomUserPicture: Codable {
    let large, medium, thumbnail: String
}
