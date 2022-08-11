//
//  BoardGameController.swift
//  Cards
//
//  Created by Zenya Kirilov on 10.08.22.
//

import UIKit

class BoardGameController: UIViewController {

    // unique card pairs count
    var cardsPairsCounts = 8
    // the 'Game' entity
    lazy var game: Game = getNewGame()

    // button for loading and overloading the game
    lazy var startButtonView = getStartButtonView()
    
    // board game
    lazy var boardGameView = getBoardGameView()
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
    }
    
    override func loadView() {
        super.loadView()
        // add the button on the scene
        view.addSubview(startButtonView)
        // add playing field on the scene
        view.addSubview(boardGameView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getStartButtonView() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        // button location changing
        button.center.x = view.center.x
        
        // getting access to the current window
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        // define the padding from the top of the window borders to the Safe Area
        let topPadding = window!.safeAreaInsets.top
        // setting an Y coordinate according to the padding
        button.frame.origin.y = topPadding
        
        // button appearence setting
        // text setting
        button.setTitle("Начать игру", for: .normal)
        // text color setting for normal (not clicked) condition
        button.setTitleColor(.black, for: .normal)
        // text color setting for clicked condition
        button.setTitleColor(.gray, for: .highlighted)
        // background color setting
        button.backgroundColor = .systemGray4
        // corners rounding
        button.layer.cornerRadius = 10
        
        // attaching a button click handler
        button.addTarget(nil, action: #selector(startGame(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func startGame(_ sender: UIButton) {
        print("button was pressed")
    }
    
    private func getBoardGameView() -> UIView {
        // game field padding from the nearest elements
        let margin: CGFloat = 10
        
        let boardView = UIView()
        
        // setting coordinates
        // x
        boardView.frame.origin.x = margin
        // y
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let topPadding = window?.safeAreaInsets.top
        boardView.frame.origin.y = topPadding! + startButtonView.frame.height + margin
        
        // width counting
        boardView.frame.size.width = UIScreen.main.bounds.width - margin*2
        // height counting
        // taking into account the bottom padding
        let bottomPadding = window?.safeAreaInsets.bottom
        boardView.frame.size.height = UIScreen.main.bounds.height - boardView.frame.origin.y - margin - bottomPadding!
        
        // changing style of the playing field
        boardView.layer.cornerRadius = 5
        boardView.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1, alpha: 0.3)
        
        return boardView
    }
    
    // cards array generating on basis of data from model
    private func getCardsBy(modelData: [Card]) -> [UIView] {
        // storage for cards view
        var cardsViews = [UIView]()
        // cards factory
        let cardViewFactory = CardViewFactory()
        // iterate the array of cards in Model
        for (index, modelCard) in modelData.enumerated() {
            // add the first card object
            let cardOne = cardViewFactory.get(modelCard.type, withSize: cardSize, andColor: modelCard.color)
            cardOne.tag = index
            cardsViews.append(cardOne)
            
            // add the second card object
            let cardTwo 
        }
    }

}
