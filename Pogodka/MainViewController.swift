//
//  MainViewController.swift
//  Pogodka
//
//  Created by Vitalii Yefimchuk on 06.04.2024.
//

import UIKit
import Core

protocol MainNavigationHandler {
    
    func mainViewController(_ vc: MainViewController, didSelectCurrent: Bool)
    func mainViewController(_ vc: MainViewController, didSelectFour: Bool)
    func mainViewController(_ vc: MainViewController, didSelectMonth: Bool)
    
    
}

final class MainViewController: UIViewController {
    
    let navigationHandler: MainNavigationHandler
    
    let button1 = WeatherButton(title: "Current Weather", color: .systemPink, image: .init(systemName: "cloud.rainbow.half") ?? UIImage.add)
    let button2 = WeatherButton(title: "Weather for a week", color: .systemBlue, image: .init(systemName: "cloud.sun") ?? UIImage.add)
    let button3 = WeatherButton(title: "A month forecast", color: .systemCyan, image: .init(systemName: "sun.max") ?? UIImage.add)
    let titleLabel = UILabel()
    
    init(navigationHandler: MainNavigationHandler) {
        self.navigationHandler = navigationHandler
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.text = "Press Button to load weather"
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(onTapped1), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(onTapped1), for: .touchUpInside)
        
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(self, action: #selector(onTapped1), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            button1.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            button1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            button1.heightAnchor.constraint(equalToConstant: 40),
            button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            button2.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 16),
            button2.heightAnchor.constraint(equalToConstant: 40),
            button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            button3.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 16),
            button3.heightAnchor.constraint(equalToConstant: 40),
            button3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
    }
    
    @objc
    private func onTapped1() {
        navigationHandler.mainViewController(self, didSelectCurrent: true)
    }
    
    @objc
    private func onTapped2() {
        navigationHandler.mainViewController(self, didSelectFour: true)
    }
    
    @objc
    private func onTapped3() {
        navigationHandler.mainViewController(self, didSelectMonth: true)
    }
}

final class TestVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
}
