//
//  Forecast.swift
//  Weather_K
//
//  Created by Kroekkittikorn Kawilo on 8/11/2565 BE.
//

import Foundation
struct Forecast: Decodable{
    var list: [List]
    
    struct List: Decodable{
        var dt: Int
        var main: Main
        var weather: [weather]
        
        struct Main: Decodable{
            var temp: Double
            
        }
        
        struct weather : Decodable{
            var main : String
        }
    }
}
