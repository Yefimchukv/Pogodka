//
//  WeatherButton.swift
//  Pogodka
//
//  Created by Vitalii Yefimchuk on 06.04.2024.
//

import UIKit

class WeatherButton: UIButton {
    
    let title: String
    let color: UIColor
    let image: UIImage
    
    init(title: String, color: UIColor, image: UIImage) {
        self.title = title
        self.color = color
        self.image = image
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    private func setupViews() {
        configuration = .borderedTinted()
        configuration?.title = title
        configuration?.image = image
        configuration?.baseBackgroundColor = .systemMint
        configuration?.baseForegroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
