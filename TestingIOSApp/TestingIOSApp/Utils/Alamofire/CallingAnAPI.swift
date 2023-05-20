//
//  CallingAnAPI.swift
//  iOS_Testing
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import Foundation
import Alamofire

class CallingAnAPI {
    func getRandomUser(success: @escaping (_ response: RandomUserModel?) -> Void) {
        AF.request("https://api.randomuser.me")
            .responseDecodable(of: RandomUserModel.self) { response in
                success(response.value)
            }
    }
    
    func getRandomUserAsync() async throws -> RandomUserModel {
        let value = try await AF.request("https://api.randomuser.me").serializingDecodable(RandomUserModel.self).value
        return value
    }
}
