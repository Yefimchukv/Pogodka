//
//  AppFlowCoordinator.swift
//  Pogodka
//
//  Created by Vitalii Yefimchuk on 06.04.2024.
//

import UIKit
import Core

protocol Coordinator {
    
    func createFlow() -> UIViewController
    
}

final class AppFlowCoordinator: Coordinator {
    
    var isUserLoggedIn: Bool {
        true
    }
    
    var topViewController: UIViewController? {
        navigationController?.topViewController
    }
    
    var navigationController: UINavigationController?
    
    func createFlow() -> UIViewController {
        if isUserLoggedIn {
            let vc = MainViewController(navigationHandler: self as MainNavigationHandler)
            navigationController = UINavigationController(rootViewController: vc)
            return navigationController!
        } else {
            let vc = TestVC()
            navigationController = UINavigationController(rootViewController: vc)
            return navigationController!
        }
    }
    
}

extension AppFlowCoordinator: MainNavigationHandler {
    
    func mainViewController(_ vc: MainViewController, didSelectCurrent: Bool) {
        let newScreen = CurrentWeatherViewController(serivce: WeatherSerivce())
        
        topViewController?.navigationController?.pushViewController(newScreen, animated: true)
    }
    
    func mainViewController(_ vc: MainViewController, didSelectFour: Bool) {
        let newScreen = TestVC()
        
        topViewController?.navigationController?.pushViewController(newScreen, animated: true)
    }
    
    func mainViewController(_ vc: MainViewController, didSelectMonth: Bool) {
        let newScreen = TestVC()
        
        topViewController?.navigationController?.pushViewController(newScreen, animated: true)
    }
    
}

