//
//  ViewController.swift
//  PulseAnimation
//
//  Created by Shi Pra on 17/10/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    let buttonWidth: CGFloat = 80
    
    // MARK: View Properties
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("OK", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        btn.layer.cornerRadius = buttonWidth / 2
        btn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return btn
    }()
    
    // MARK: Initializer
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        addBtn()
        // Do any additional setup after loading the view.
    }

    // MARK: Helper Methods
    func addBtn() {
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1).isActive = true
    }

    @objc func buttonPressed() {
        let pulse = PulseLayer(numberOfPulses: 1, radius: buttonWidth * 2, position: button.center)
        pulse.animationDuration = 1.5
        pulse.backgroundColor = UIColor.white.cgColor
        
        self.view.layer.insertSublayer(pulse, below: button.layer)
    }
}

