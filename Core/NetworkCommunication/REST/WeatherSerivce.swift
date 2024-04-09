//
//  WeatherSerivce.swift
//  Core
//
//  Created by Vitalii Yefimchuk on 06.04.2024.
//

import Foundation

public enum Days: Int {
    
    case current
    case four
    case thirty
    
    public var hashValue: Int {
        switch self {
        case .current:
            0
        case .four:
            4
        case .thirty:
            30
        }
    }
    
}

public protocol WeatherSerivceProtocol {
    
    func fetchWeather() async throws -> Weather
    func fetchForecast(_ days: Days) async throws -> [Weather]
    
}

public class WeatherSerivce: WeatherSerivceProtocol {
    
    public init() {}
    
    public func fetchWeather() async throws -> Weather {
        .init(main: .init(temp: 22, temp_min: 10, temp_max: 25), name: "Kyiv")
    }
    
    public func fetchForecast(_ days: Days) async throws -> [Weather] {
        [
            .init(main: .init(temp: 20, temp_min: 10, temp_max: 25), name: "Kyiv"),
            .init(main: .init(temp: 21, temp_min: 12, temp_max: 26), name: "Lviv")
        ]
    }

}
