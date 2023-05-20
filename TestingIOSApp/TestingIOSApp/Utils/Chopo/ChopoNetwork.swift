////
////  ChopoNetwork.swift
////  TestingIOSApp
////
////  Created by Aarón Alberto Martínez Cuevas on 15/04/23.
////
//
// import Foundation
// import Combine
// import SwiftUI
// import CoreLocation
//
// class ChopoNetwork {
//    /// Complete URL of the request
//    var url: String = ""
//    /// Headers of the request
//    var headers: [String: String]
//    /// Parameters of the request
//    var parameters: [String: Any]
//    /// Array parameters
//    var parametersArray: [[String: String]]
//    /// Value to know if add parameters to GET petition
//    var addParamsToPath: Bool
//    /// Parameters for the path
//    var pathParams: String
//    /// Method of the request
//    var method: HTTPMethod
//    /// Serialization of the parameters
//    var serialization: ParameterSerialization
//
//    var cancellables = Set<AnyCancellable>()
//
//    var locManager = CLLocationManager()
//
//    private static var enviroment: Environment = .production
//
//    init(
//        environment: Environment = ChopoNetwork.enviroment,
//        baseURL: BaseURL = .api,
//        endpoint: String = "",
//        headers: [String: String] = [:],
//        parameters: [String: Any] = [:],
//        parametersArray: [[String: String]] = [],
//        addParamsToPath: Bool = false,
//        pathParams: String = "",
//        method: HTTPMethod = .get,
//        serialization: ParameterSerialization = .data
//    ) {
//        let keys = Keys.AccesoSaludKeys()
//
//        switch (environment, baseURL) {
//        case (.dev, .api): self.url += keys.apiDevPath
//        case (.dev, .auth): self.url += keys.authDevPath
//        case (.qa, .api): break
//        case (.qa, .auth): break
//        case (.prod, .api): self.url += keys.apiProdPath
//        case (.prod, .auth): self.url += keys.authDevPath
//        }
//
//        // Setting the endpoint to the base URL
//        self.url += endpoint
//
//        if addParamsToPath {
//            self.url += pathParams
//        //            self.url += pathParams.replacingOccurrences(of: " ", with: "%20")
//        }
//
//        // Set the information for future request
//        self.headers = headers
//        self.parameters = parameters
//        self.parametersArray = parametersArray
//        self.addParamsToPath = addParamsToPath
//        self.pathParams = pathParams
//        self.method = method
//        self.serialization = serialization
//
//        //Removes empty spaces for safety
////        self.url = self.url.replacingOccurrences(of: " ", with: "%20")
//    }
//
//    func executeQuery<T>(type: T.Type) -> AnyPublisher<T, NetworkError> where T: Decodable {
//        guard let url: URL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? "") else {
//            return Fail(error: NetworkError.unknown).eraseToAnyPublisher()
//        }
//        var request = URLRequest(url: url)
//
//        //Setting the headers of the request
//        request.setValue("es_MX", forHTTPHeaderField: "lenguage")
//        request.setValue(getNowDateWithHeaderFormat(), forHTTPHeaderField: "request-date")
//        request.setValue("America/Mexico_City", forHTTPHeaderField: "time-zone-user")
//        request.setValue(UIDevice.current.identifierForVendor?.uuidString, forHTTPHeaderField: "mac-address")
//        request.setValue("mobile-iOS", forHTTPHeaderField: "client-operation-code")
//        request.setValue("\(locManager.location?.coordinate.latitude ?? 0)", forHTTPHeaderField: "latitude")
//        request.setValue("\(locManager.location?.coordinate.longitude ?? 0)", forHTTPHeaderField: "longitude")
//
//        for (header, value) in headers {
//            request.setValue(value, forHTTPHeaderField: header)
//        }
//
//        // Setting the parameters and the method of the request (if is POST)
//        switch method {
//        case .get, .delete:
//            if method == .get {
//                request.httpMethod = "GET"
//            } else {
//                request.httpMethod = "DELETE"
//            }
//
//        case .post, .put:
//            if method == .post {
//                request.httpMethod = "POST"
//            } else {
//                request.httpMethod = "PUT"
//            }
//
//            var formParameters = ""
//            for (key, value) in parameters {
//                formParameters += "\(key)=\(value)&"
//            }
//            formParameters = String(formParameters.dropLast())
//
//            var parametersData = Data()
//
//            if serialization == .data {
//                parametersData = formParameters.data(using: .utf8)!
//            } else {
//                if parametersArray.isEmpty {
//                    parametersData = try! JSONSerialization.data(withJSONObject: parameters)
//                } else {
//                    parametersData = try! JSONSerialization.data(withJSONObject: parametersArray)
//                }
//            }
//
//            request.httpBody = parametersData
//        }
//
// #if DEBUG
//        print("Request information: ")
//        print("URL: \(request.url!)\nMethod: \(request.httpMethod!)\nHeaders: \(request.allHTTPHeaderFields!)\nParameters: \(self.parameters)")
// #endif
//
//        return URLSession
//            .shared
//            .dataTaskPublisher(for: request)
//            .receive(on: DispatchQueue.main)
//            .mapError { _ in NetworkError.unknown }
//            .flatMap { data, response -> AnyPublisher<T, NetworkError> in
// #if DEBUG
//                print(String(data: data, encoding: .utf8)!)
// #endif
//                guard let response = response as? HTTPURLResponse else {
//                    return Fail(error: NetworkError.unknown).eraseToAnyPublisher()
//                }
//
//                if (200...299).contains(response.statusCode) {
//                    return Just(data)
//                        .decode(type: T.self, decoder: JSONDecoder())
//                        .mapError { _ in NetworkError.decodingError }
//                        .eraseToAnyPublisher()
//                } else {
//                    return Fail(error: NetworkError.errorCode(response.statusCode, data)).eraseToAnyPublisher()
//                }
//            }
//            .eraseToAnyPublisher()
//    }
//
//    private func getNowDateWithHeaderFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
//
//        return dateFormatter.string(from: Date()) + "Z"
//    }
//
//    private func getNowDateWithStatisticFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//
//        return dateFormatter.string(from: Date())
//    }
//
//    private func getNowDateWithEventFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//
//        return dateFormatter.string(from: Date())
//    }
//
//    func getEnviroment() -> Environment {
//        return ChopoNetwork.enviroment
//    }
//
//    func generateAPIToken() -> AnyPublisher<Oauth2Response, NetworkError> {
////        var token = Keys.AccesoSaludKeys().basicAuthorization
//        switch ChopoNetwork.enviroment {
//        case .production:
////            token = Keys.AccesoSaludKeys().basicAuthorization
//            break
//        case .qualityAssurance:
////            token = Keys.AccesoSaludKeys().basicAuthorizationDev
//            break
//        case .development:
////            token = Keys.AccesoSaludKeys().basicAuthorizationDev
//            break
//        }
//
//        return ChopoNetwork(
//            baseURL: .auth,
//            endpoint: Keys.AccesoSaludKeys().oauth2TokenURL,
//            headers: ["Authorization": "Basic \(token)",
//                      "Content-Type": "application/x-www-form-urlencoded"],
//            parameters: ["grant_type": "client_credentials"],
//            method: .post)
//            .executeQuery(type: Oauth2Response.self)
//    }
//
//    func generateStatisticsCall(token: String, name: String, data: String) -> AnyPublisher<GenericResponse, NetworkError> {
//
//        return ChopoNetwork(
//            endpoint: Keys.AccesoSaludKeys().increaseStatistic,
//            headers: ["Authorization": "Bearer \(token)",
//                      "Content-Type": "application/json; charset=UTF-8"],
//            parameters: [
//                "idTipoComponente": 4,
//                "idComponente": 9,
//                "idNombre": name,
//                "fecha": getNowDateWithStatisticFormat(),
//                "valor": 1.0,
//                "datos": data
//            ],
//            method: .post,
//            serialization: .jsonData)
//            .executeQuery(type: GenericResponse.self)
//    }
//
//    func generateAppUseStatisticCall(token: String) -> AnyPublisher<GenericResponse, NetworkError> {
//
//        return ChopoNetwork(
//            endpoint: Keys.AccesoSaludKeys().sendEvent,
//            headers: ["Authorization": "Bearer \(token)",
//                      "Content-Type": "application/json; charset=UTF-8"],
//            parameters: [
//                "idTypeId": 1,
//                "id": Int(UserDefaults.standard.savedPatientID) ?? 0,
//                "eventType": 19,
//                "date": getNowDateWithEventFormat(),
//                "occurrence": 1,
//                "accumulated": 0,
//                "attributes": "iOS"
//            ],
//            method: .post,
//            serialization: .jsonData)
//            .executeQuery(type: GenericResponse.self)
//    }
// }
