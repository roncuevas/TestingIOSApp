import Foundation
import RealmSwift

class RandomUserDatabase {
    
    var realm: Realm? = try? Realm()
    
    func writeRandomUser(user: RandomUserRealmModel) {
        guard let realm else { return }
        try? realm.write {
            realm.add(user)
        }
    }
    
    func readRandomUsers() -> Results<RandomUserRealmModel>? {
        guard let realm else { return nil }
        let results = realm.objects(RandomUserRealmModel.self)
        debugPrint(results)
        return results
    }
}
