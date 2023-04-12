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
}
