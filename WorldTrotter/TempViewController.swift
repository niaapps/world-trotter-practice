//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Sarah Mogin on 2/13/23.
//

import UIKit

class TempViewController: UIViewController {

//    override func viewDidLoad() {
//        print("TempViewController - \(#function)")
//        super.viewDidLoad()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
//        print("TempViewController - \(#function)")
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
        super.viewDidAppear(animated)
    }
    
//        let firstFrame = CGRect(x: 0, y: 0, width: 100, height: 150)
//        CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize())
//        let firstView = UIView(frame: firstFrame)
//        firstView.backgroundColor = UIColor.cyan

        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [UIColor.red.cgColor,
//                                UIColor.yellow.cgColor,
//                                UIColor.green.cgColor,
//                                UIColor.blue.cgColor]
//
//        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
//        view.layer.insertSublayer(gradientLayer, at: 0)
        
//        print(view.layer.sublayers)

//        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
//        let secondView = UIView(frame: secondFrame)
//        secondView.backgroundColor = UIColor.purple
//        firstView.addSubview(secondView)
}

