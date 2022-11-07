//
//  NetworkController.swift
//  Weather_K
//
//  Created by Kroekkittikorn Kawilo on 7/11/2565 BE.
//

import Foundation
struct NetworkController {
    
    private static var baseUrl = "api.openweathermap.org"
    private static let apiKey = "fc954186a6fb9cca05088ae246960f0e"
    
    enum Endpoint {
        case cityId(path: String = "/data/2.5/weather", id: Int)
        
        var url: URL? {
            var components = URLComponents()
            
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryItems
            
            return components.url
        }
        
        private var path: String {
            switch self {
            case .cityId(let path, _):
                return path
            }
        }
        
        private var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            
            switch self {
            case .cityId(_, let id):
                queryItems.append(URLQueryItem(name: "id", value: String(id)))
            }
            
            queryItems.append(URLQueryItem(name: "appid", value: apiKey))
            
            return queryItems
        }
    }
    
    static func fetchWeather(for cityId: Int = 1609350, _ completion: @escaping ((Weather) -> Void)) {
        if let url = Endpoint.cityId(id: cityId).url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Whoops, and error occured!", error)
                }
                
                if let data = data {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(weather)
                    } catch let error {
                        print("failed to decode object...", error)
                    }
                    
                }
            }.resume()
        }
    }
}
struct NetworkController2 {
    
    private static var baseUrl = "api.openweathermap.org"
    private static let apiKey = "fc954186a6fb9cca05088ae246960f0e"
    
    enum Endpoint {
        case cityId(path: String = "/data/2.5/forecast", id: Int)
        
        var url: URL? {
            var components = URLComponents()
            
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryItems
            
            return components.url
        }
        
        private var path: String {
            switch self {
            case .cityId(let path, _):
                return path
            }
        }
        
        private var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            
            switch self {
            case .cityId(_, let id):
                queryItems.append(URLQueryItem(name: "id", value: String(id)))
            }
            
            queryItems.append(URLQueryItem(name: "appid", value: apiKey))
            
            return queryItems
        }
    }
    
    static func fetchForecast(for cityId: Int = 1609350, _ completion: @escaping ((Forecast) -> Void)) {
        if let url = Endpoint.cityId(id: cityId).url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Whoops, and error occured!", error)
                }
                
                if let data = data {
                    do {
                        let forecast = try JSONDecoder().decode(Forecast.self, from: data)
                        completion(forecast)
                    } catch let error {
                        print("failed to decode object...", error)
                    }
                    
                }
            }.resume()
        }
    }
}
