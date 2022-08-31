//
//  Shapes.swift
//  Cards
//
//  Created by Zenya Kirilov on 10.08.22.
//

import Foundation
import UIKit

protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() не может быть использован для создания экземпляра")
    }
}

// MARK: - Circle shape
class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        // counting data for a circle
        // radius is equal to a half of the smaller part
        let radius = ([size.width, size.height].min() ?? 0) / 2
        // the center of the circle is equal to centers of each side
        let centerX = size.width / 2
        let centerY = size.height / 2
        
        // drawing a circle
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.close()
        // created path initializing
        self.path = path.cgPath
        // color changing
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Square shape
class SquareShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        // a side is equal to the smallest side
        let edgeSize = ([size.width, size.height].min() ?? 0)
        // square drawing
        let rect = CGRect(x: 0, y: 0, width: edgeSize, height: edgeSize)
        let path = UIBezierPath(rect: rect)
        path.close()
        // created path initializing
        self.path = path.cgPath
        // color changing
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Cross shape
class CrossShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        // cross drowing
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.move(to: CGPoint(x: size.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        
        // created path initializing
        self.path = path.cgPath
        // color changing
        self.strokeColor = fillColor
        self.lineWidth = 5
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Fill shape
class FillShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.path = path.cgPath
        self.fillColor = fillColor
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Back side circle
class BackSideCircle: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        
        // drawing 15 circles
        for _ in 1...15 {
            
            // coordinates of the center of the following circle
            let randomX = Int.random(in: 0...Int(size.width))
            let randomY = Int.random(in: 0...Int(size.height))
            let center = CGPoint(x: randomX, y: randomY)
            // moving the pointer to the center of a circle
            path.move(to: center)
            // random radius generation
            let radius = Int.random(in: 5...15)
            // circle drawing
            path.addArc(withCenter: center, radius: CGFloat(radius), startAngle: 0, endAngle: .pi*2, clockwise: true)
        }
        
        // created path initializing
        self.path = path.cgPath
        // color changing
        self.strokeColor = fillColor
        self.fillColor = fillColor
        self.lineWidth = 1
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Back side line
class BackSideLine: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        
        // drawing 15 lines
        for _ in 1...15 {
            
            // coordinates of the begining of the following line
            let randomXStart = Int.random(in: 0...Int(size.width))
            let randomYStart = Int.random(in: 0...Int(size.height))
            
            // coordinates of the end of the following line
            let randomXEnd = Int.random(in: 0...Int(size.width))
            let randomYEnd = Int.random(in: 0...Int(size.height))
            
            // moving the pointer to the begining of the line
            path.move(to: CGPoint(x: randomXStart, y: randomYStart))
            
            // drawing a line
            path.addLine(to: CGPoint(x: randomXEnd, y: randomYEnd))
        }
        
        // created path initializing
        self.path = path.cgPath
        // line style changing
        self.strokeColor = fillColor
        self.lineWidth = 3
        self.lineCap = .round
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
