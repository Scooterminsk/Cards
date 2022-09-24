//
//  StartScreenController.swift
//  Cards
//
//  Created by Zenya Kirilov on 26.08.22.
//

import UIKit

class StartScreenController: UIViewController {
   
    // user defaults game storage
    var gameStorage: GameStorage!
    
    // an image
    lazy var image = getImage()
    
    // start game button var
    lazy var startGameButton = getStartGameButton()
    
    // to edit screen button var
    lazy var editScreenButton = getToEditScreenButton()
    
    // continue game button var
    lazy var continueGameButton = getContinueGameButton()
    
    // board game controller var to transit to it from the home screen
    lazy var boardGameController = BoardGameController()
    
    // edit screen controller var to transit to it from the home screen
    lazy var editScreenController = EditScreenController()
    
    override func loadView() {
        super.loadView()
        view.addSubview(image)
        view.addSubview(startGameButton)
        view.addSubview(editScreenButton)
        view.addSubview(continueGameButton)
        self.navigationItem.backBarButtonItem = BackBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        gameStorage = GameStorage()
        continueGameButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // continueGameButton.isHidden = gameStorage.loadCardViews().isEmpty ? true: false
    }
    
    // MARK: - Creating an image view to insert a picture on the screen
    
    private func getImage() -> UIImageView {
        let imageName = "card-game.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        
        imageView.center.x = view.center.x
        imageView.center.y = view.center.y - 130
        
        return imageView
    }
    
    // MARK: - Creating a button to start new game
    private func getStartGameButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        // button location changing
        button.center = view.center
        
        // button appearence settings
        button.setTitle("Игра", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        
        // attaching a button click handler
        button.addTarget(nil, action: #selector(toTheGame(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func toTheGame(_ sender: UIButton) {
        self.navigationController?.pushViewController(boardGameController, animated: true)
        self.navigationController?.viewControllers.forEach({ viewController in
            if let viewController = (viewController as? BoardGameController) {
                for card in viewController.cardViews {
                    card.removeFromSuperview()
                }
                viewController.cardViews = []
                viewController.flipsCount = 0
               // viewController.scoreLabel.text = "Осталось пар карт: 0"
            }
        })
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Creating a button to get to the edit screen
    private func getToEditScreenButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        // button location changing
        button.center.x = view.center.x
        button.center.y = view.center.y + 60
        
        // button appearence settings
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        
        // attaching a button click handler
        button.addTarget(nil, action: #selector(goToEditScreen(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func goToEditScreen(_ sender: UIButton) {
        self.navigationController?.viewControllers.insert(boardGameController, at: 0)
        self.navigationController?.viewControllers[0].navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
        self.navigationController?.pushViewController(editScreenController, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Creating a button to continue the previous game
    private func getContinueGameButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        // button location changing
        button.center.x = view.center.x
        button.center.y = editScreenButton.frame.maxY + 60
        
        // button appearence settings
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        
        // attaching a button click handler
        button.addTarget(nil, action: #selector(continueGame(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func continueGame(_ sender: UIButton) {
        self.navigationController?.pushViewController(boardGameController, animated: true)
    }
}
