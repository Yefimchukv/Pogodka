//
//  Weather.swift
//  Core
//
//  Created by Vitalii Yefimchuk on 06.04.2024.
//

import Foundation

public struct Weather {
    
    public struct Main {
        
        public let temp: Double
        public let temp_min: Double
        public let temp_max: Double
    }
    
    public let main: Main
    public let name: String
    
}


