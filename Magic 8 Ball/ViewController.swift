//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let arrayAnswers = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball5")]
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Ask me"
        label.textColor = UIColor(named: "Color")
        label.font = .systemFont(ofSize: 45, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ball1")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let askButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ask", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        button.backgroundColor = UIColor(named: "Color")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackViewMain: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewHeader: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewImage: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewButton: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        view.addSubview(stackViewMain)
        
        askButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackViewMain.addArrangedSubview(stackViewHeader)
        stackViewMain.addArrangedSubview(stackViewImage)
        stackViewMain.addArrangedSubview(stackViewButton)
        stackViewHeader.addSubview(headerLabel)
        stackViewImage.addSubview(imageView)
        stackViewMain.addSubview(askButton)
        
        NSLayoutConstraint.activate([
            stackViewMain.topAnchor.constraint(equalTo: view.topAnchor),
            stackViewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            headerLabel.centerXAnchor.constraint(equalTo: stackViewHeader.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: stackViewHeader.centerYAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: stackViewImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: stackViewImage.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            askButton.centerXAnchor.constraint(equalTo: stackViewButton.centerXAnchor),
            askButton.centerYAnchor.constraint(equalTo: stackViewButton.centerYAnchor),
            askButton.widthAnchor.constraint(equalToConstant: 200),
            askButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func pressButton() {
        imageView.image = arrayAnswers.randomElement()
    }
    
}
