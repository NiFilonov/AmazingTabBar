//
//  AmazingTabBar.swift
//  AmazingTabBar
//
//  Created by Dragonborn on 24.01.2021.
//

import Foundation
import UIKit

@IBDesignable
class AmazingTabBar: UITabBar {
    
    // Слой с полукругом
    private var mainLayer: CALayer?
    // Круглая кнопка
    private var button: UIButton?
    // Высота углубления для кнопки
    private var height: CGFloat = 37.0
    // Диаметр кнопки
    private var buttonDiameter: CGFloat = 65.0
    
    override func draw(_ rect: CGRect) {
        addShape()
        addButton()
    }
    
    // Функция, которая создает форму UITabBar с углублением под кнопку
    private func createPath() -> CGPath {
        // 1
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        // 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0))
        
        // 3
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: centerWidth - 30, y: 0),
                      controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        
        // 4
        path.addCurve(to: CGPoint(x: centerWidth + height * 2, y: 0),
                    controlPoint1: CGPoint(x: centerWidth + 35, y: height),
                    controlPoint2: CGPoint(x: centerWidth + 30, y: 0))
        
        // 5
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        return path.cgPath
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.insertSublayer(shapeLayer, at: 0)
        
        self.mainLayer = shapeLayer
    }
    
    private func addButton() {
        button = UIButton()
        button?.frame = CGRect(x: self.frame.width / 2 - buttonDiameter / 2,
                               y: -(buttonDiameter / 2),
                               width: buttonDiameter,
                               height: buttonDiameter)
        button?.layer.cornerRadius = buttonDiameter / 2
        button?.backgroundColor = .purple
        button?.setTitle("+", for: .normal)
        addSubview(button!)
    }
    
}
