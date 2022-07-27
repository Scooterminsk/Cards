//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        setupViews()
    }
    
    // setting views of the scene
    private func setupViews() {
        // root view creation
        self.view = getRootView()
        let redView = getRedView()
        let greenView = getGreenView()
        let whiteView = getWhiteView()
        let pinkView = getPinkView()
        
        // red view rotation
        redView.transform = CGAffineTransform(rotationAngle: .pi/3)
        
        set(view: greenView, toCenterOfView: redView)
        // white view positioning using 'center' property
        whiteView.center = greenView.center
        
        self.view.addSubview(redView)
        self.view.addSubview(pinkView)
        redView.addSubview(greenView)
        redView.addSubview(whiteView)
    }
    
    // root view creation
    private func getRootView() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
    
    // red view creation
    private func getRedView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 50, width: 200, height: 200)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }
    
    // green view creation
    private func getGreenView() -> UIView {
        let viewFrame = CGRect(x: 10, y: 10, width: 180, height: 180)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    
    // white view creation
    private func getWhiteView() -> UIView {
        let viewFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    
    // pink view creation
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 300, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.yellow.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 10, height: 20)
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.opacity = 0.7

        // child layer creation
        let layer = CALayer()
        // background color changing
        layer.backgroundColor = UIColor.black.cgColor
        // size and coordinates changing
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        // corner radius changing
        layer.cornerRadius = 10
        // addition to the layer hierarchy
        view.layer.addSublayer(layer)
        
        /*
        // print sizes of the view
        print(view.frame)
        // view rotation
        view.transform = CGAffineTransform(rotationAngle: .pi/4)
        // print sizes of the view
        print(view.frame)
         
         */
        /* // view tension and compression
        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
         */
        
        /* // moving a view
        view.transform = CGAffineTransform(translationX: 100, y: 5)
        */
        
        return view
    }
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        /*
        // nested view size
        let moveViewWidth = moveView.frame.width
        let moveViewHeight = moveView.frame.height
        
        // parent view size
        let baseViewWidth = baseView.bounds.width
        let baseViewHeight = baseView.bounds.height
        */
        // a view calculation and changing
        moveView.center = CGPoint(x: baseView.bounds.midX, y: baseView.bounds.midY)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
