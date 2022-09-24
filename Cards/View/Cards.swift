//
//  Cards.swift
//  Cards
//
//  Created by Zenya Kirilov on 10.08.22.
//

import Foundation
import UIKit

protocol FlippableView: UIView {
    var isFlipped: Bool { get set }
    var flipCompletionHandler:((FlippableView) -> Void)? { get set }
    func flip()
}

// available back side patterns
var backShapes = ["circle", "line"]

class CardView<ShapeType: ShapeLayerProtocol>: UIView, FlippableView {
    
    var isFlipped: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var flipCompletionHandler: ((FlippableView) -> Void)?
    func flip() {
        // determine between which views to transition
        let fromView = isFlipped ? frontSideView : backSideView
        let toView = isFlipped ? backSideView : frontSideView
        // starting animated transition
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionFlipFromTop], completion: { _ in
            // rotation handler
            self.flipCompletionHandler?(self)
        })
        isFlipped = !isFlipped
    }
    
    // shape color
    var color: UIColor!
    
    // corner radius
    var cornerRadius = 20
    
    // borders setup
    private func setupBorders() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        // deletion of subviews that were added before
        backSideView.removeFromSuperview()
        frontSideView.removeFromSuperview()
        
        // new views addition
        if isFlipped {
            self.addSubview(backSideView)
            self.addSubview(frontSideView)
        } else {
            self.addSubview(frontSideView)
            self.addSubview(backSideView)
        }
        
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
       
        setupBorders()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // internal view padding
    private let margin: Int = 10
    
    // front side card view
    lazy var frontSideView: UIView = self.getFrontSideView()
    // back side card view
    lazy var backSideView: UIView = self.getBackSideView()
    
    //MARK: - Returns view for the front side of the card
    private func getFrontSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .white
        
        let shapeView = UIView(frame: CGRect(x: margin, y: margin, width: Int(self.bounds.width)-margin*2, height: Int(self.bounds.height)-margin*2))
        view.addSubview(shapeView)
        
        // layer with a shape creation
        let shapeLayer = ShapeType(size: shapeView.frame.size, fillColor: color.cgColor)
        if shapeLayer.fillColor == UIColor.white.cgColor {
            shapeLayer.strokeColor = UIColor.black.cgColor
        }
        shapeView.layer.addSublayer(shapeLayer)
        // round the corners of the root layer
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(cornerRadius)
        
        
        return view
    }
    
    //MARK: - Returns view for the back side of the card
    private func getBackSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        
        view.backgroundColor = .white
        
        // random pattern choosing
        switch backShapes.randomElement()! {
        case "circle":
            let layer = BackSideCircle(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        case "line":
            let layer = BackSideLine(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        default:
            break
        }
        
        // round the corners of the root layer
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(cornerRadius)
        
        return view
    }
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.responderChain())
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved Card")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded Card")
    }
    */
    
    // MARK: - Touches
    // anchor point
    var currentAnchorPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    private var startTouchPoint: CGPoint!
    
    // boolean variable that shows is that all cards are fliped or not
    var isAllCardsFlipped = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // anchor point coordinates changing
        currentAnchorPoint.x = touches.first!.location(in: window).x - frame.minX
        currentAnchorPoint.y = touches.first!.location(in: window).y - frame.minY
        
        // original coordinates saving
        startTouchPoint = frame.origin
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.frame.origin.x = touches.first!.location(in: window).x - currentAnchorPoint.x
        self.frame.origin.y = touches.first!.location(in: window).y - currentAnchorPoint.y
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.frame.origin == startTouchPoint && allCardsFlipped == false {
            flip()
        }
        if self.frame.maxX > ((window?.frame.maxX)! - 20) || self.frame.maxY > ((window?.frame.maxY)! - 150) || self.frame.origin.x < (window?.frame.minX)! || self.frame.origin.y < ((window?.frame.minY)! + 40) {
            // animatedly return the card to its original position
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.frame.origin = self.startTouchPoint
                /*
                // flip the view
                if self.transform.isIdentity {
                    self.transform = CGAffineTransform(rotationAngle: .pi)
                } else {
                    self.transform = .identity
                }
                 */
            }
            return
        }
    }

}

