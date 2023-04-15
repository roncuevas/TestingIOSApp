//
//  RealmManager.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 13/04/23.
//

import Foundation
import RealmSwift

class RealmManager {
    
    // Open the local-only default realm
    let realm: Realm? = try? Realm()
    
}

// MARK: RandomUser
extension RealmManager {
    
    func writeRandomUser(user: RandomUserRealmModel) {
        try? realm?.write {
            realm?.add(user)
        }
    }
    
    func readRandomUsers() -> Results<RandomUserRealmModel>? {
        return realm?.objects(RandomUserRealmModel.self)
    }
}
