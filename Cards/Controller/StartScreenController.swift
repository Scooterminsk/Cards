//
//  StartScreenController.swift
//  Cards
//
//  Created by Zenya Kirilov on 26.08.22.
//

import UIKit

class StartScreenController: UIViewController {
   
    // start game button var
    lazy var startGameButton = getStartGameButton()
    
    // to edit screen button var
    lazy var editScreenButton = getToEditScreenButton()
    
    // board game controller var to transit to it from the home screen
    lazy var boardGameController = BoardGameController()
    
    // edit screen controller var to transit to it from the home screen
    lazy var editScreenController = EditScreenController()
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(startGameButton)
        view.addSubview(editScreenButton)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        button.addTarget(nibName, action: #selector(goToEditScreen(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func goToEditScreen(_ sender: UIButton) {
        self.navigationController?.pushViewController(editScreenController, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
