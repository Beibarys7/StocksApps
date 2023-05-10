//
//  Router.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 20.04.2023.
//

import Foundation

protocol Router { // Как раз таки описывають наш request и его создасть
    typealias Headers = [String: String]
    typealias Parameters = [String: Any]
    typealias Body = [String: Any?]
    
    var baseUrl: String { get }
    var path: String { get }
    var headers: Headers { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var body: Body { get } // для post запросов
     
    func request() throws -> URLRequest // есть функция которое сам request будет нам отдавать
}

extension Router {
    var headers: Headers {
        [:] //будет пустым потому что нам не нужен header используется для авторизации и необезательно реализовать
    }
    
    var body: Body {
        [:]
    }
    
    var httpBody: Data? {
        if body.isEmpty { return nil }
        return try? JSONSerialization.data(withJSONObject: body, options: [])
        
        // что бы из Dictionary сделать дату data
    }
}

extension Router {
    func request() throws -> URLRequest {
        let urlString  = baseUrl + path
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.missingURL
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.httpBody = httpBody
        
        addHeaders(to: &request)
        try addParameters(to: &request)
        
        return request
    }
    
    private func addParameters (to request: inout URLRequest) throws {
        guard let url = request.url else { throw NetworkError.missingURL}
        
        if var urlComponents = URLComponents (url: url, resolvingAgainstBaseURL: false) {
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                    let queryItem = URLQueryItem(name: key, value: "\(value)")
                    urlComponents.queryItems?.append (queryItem)
            }
            request.url = urlComponents.url
        }
    }
    
    private func addHeaders (to request: inout URLRequest) {
            for (key, value) in headers {
                request.setValue (value, forHTTPHeaderField: key)
            }
        }
}
