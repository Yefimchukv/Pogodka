//
//  CurrentWeatherViewController.swift
//  Pogodka
//
//  Created by Vitalii Yefimchuk on 06.04.2024.
//

import UIKit
import Core

final class CurrentWeatherViewController: UIViewController {
    
    let titleLabel = UILabel()
    let currentTemperatureLabel = UILabel()
    let minTemperatureLabel = UILabel()
    let maxTemperatureLabel = UILabel()
    
    let serivce: WeatherSerivceProtocol
    
    init(serivce: WeatherSerivceProtocol) {
        self.serivce = serivce
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            
            let weather = try await serivce.fetchWeather()
            
            updateLabels(with: weather)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        minTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .center
        currentTemperatureLabel.textAlignment = .center
        minTemperatureLabel.textAlignment = .center
        maxTemperatureLabel.textAlignment = .center
        
        
        view.addSubview(titleLabel)
        view.addSubview(currentTemperatureLabel)
        view.addSubview(minTemperatureLabel)
        view.addSubview(maxTemperatureLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 240),
            
            currentTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentTemperatureLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            currentTemperatureLabel.heightAnchor.constraint(equalToConstant: 40),
            currentTemperatureLabel.widthAnchor.constraint(equalToConstant: 240),
            
            minTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minTemperatureLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 16),
            minTemperatureLabel.heightAnchor.constraint(equalToConstant: 40),
            minTemperatureLabel.widthAnchor.constraint(equalToConstant: 240),
            
            maxTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maxTemperatureLabel.topAnchor.constraint(equalTo: minTemperatureLabel.bottomAnchor, constant: 16),
            maxTemperatureLabel.heightAnchor.constraint(equalToConstant: 40),
            maxTemperatureLabel.widthAnchor.constraint(equalToConstant: 240),
        ])
    }
    
    private func updateLabels(with weather: Weather) {
        titleLabel.text = weather.name
        currentTemperatureLabel.text = String(weather.main.temp)
        minTemperatureLabel.text = String(weather.main.temp_min)
        maxTemperatureLabel.text = String(weather.main.temp_max)
    }
    
}
