//
//  Weather.swift
//  Weather_K
//
//  Created by Kroekkittikorn Kawilo on 7/11/2565 BE.
//

import Foundation

struct Weather: Decodable {
    var main: Main
    var weather : [weather]
    
    struct Main:Decodable {
        var temp: Double
        var humidity: Double
        
    }
    struct weather:Decodable{
        var main: String
        
        
    }
}

