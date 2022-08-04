//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

protocol FlippableView: UIView {
    var isFlipped: Bool { get set }
    var flipCompletionHandler:((FlippableView) -> Void)? { get set }
    func flip()
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() не может быть использован для создания экземпляра")
    }
}

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

class CardView<ShapeType: ShapeLayerProtocol>: UIView, FlippableView {
    
    var isFlipped: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var flipCompletionHandler: ((FlippableView) -> Void)?
    func flip() {}
    
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
    
    // returns view for the front side of the card
    private func getFrontSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .white
        
        let shapeView = UIView(frame: CGRect(x: margin, y: margin, width: Int(self.bounds.width)-margin*2, height: Int(self.bounds.height)-margin*2))
        view.addSubview(shapeView)
        
        // layer with a shape creation
        let shapeLayer = ShapeType(size: shapeView.frame.size, fillColor: color.cgColor)
        shapeView.layer.addSublayer(shapeLayer)
        
        return view
    }
    
    // returns view for the back side of the card
    private func getBackSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        
        view.backgroundColor = .white
        
        // random pattern choosing
        switch ["circle", "line"].randomElement()! {
        case "circle":
            let layer = BackSideCircle(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        case "line":
            let layer = BackSideLine(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        default:
            break
        }
        return view
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        /* // circle
        view.layer.addSublayer(CircleShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
         */
        /* // square
        view.layer.addSublayer(SquareShape(size: CGSize(width: 100, height: 100), fillColor: UIColor.gray.cgColor))
         */
        /* // cross
        view.layer.addSublayer(CrossShape(size: CGSize(width: 100, height: 100), fillColor: UIColor.gray.cgColor))
         */
        /* // fill shape
        view.layer.addSublayer(FillShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
         */
        
        // face down playing card
        let firstCardView = CardView<CircleShape>(frame: CGRect(x: 0, y: 0, width: 120, height: 150), color: .red)
        self.view.addSubview(firstCardView)
        
        // face up playing card
        let secondCardView = CardView<CircleShape>(frame: CGRect(x: 200, y: 0, width: 120, height: 150), color: .red)
        self.view.addSubview(secondCardView)
        secondCardView.isFlipped = true
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
