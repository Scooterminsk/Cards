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

    // card sizes
    private var cardSize: CGSize {
        CGSize(width: 80, height: 120)
    }
    
    // card placement limit coordinates
    private var cardMaxXCoordinate: Int {
        Int(boardGameView.frame.width - cardSize.width)
    }
    private var cardMaxYCoordinate: Int {
        Int(boardGameView.frame.height - cardSize.height)
    }
    
    // playing cards
    var cardViews = [UIView]()
    
    private var flippedCards = [UIView]()
    
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
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
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
        game = getNewGame()
        let cards = getCardsBy(modelData: game.cards)
        placeCardsOnBoard(cards)
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
            let cardTwo = cardViewFactory.get(modelCard.type, withSize: cardSize, andColor: modelCard.color)
            cardTwo.tag = index
            cardsViews.append(cardTwo)
        }
        // add flip handler to all the cards
        for card in cardsViews {
            (card as! FlippableView).flipCompletionHandler = { [self] flippedCard in
                // transfer the card to the top of the hierarchy
                flippedCard.superview?.bringSubviewToFront(flippedCard)
                
                // add or delete a card
                if flippedCard.isFlipped {
                    self.flippedCards.append(flippedCard)
                } else {
                    if let cardIndex = self.flippedCards.firstIndex(of: flippedCard) {
                        self.flippedCards.remove(at: cardIndex)
                    }
                }
                
                // if 2 cards are flipped
                if self.flippedCards.count == 2 {
                    // getting cards from model data
                    let firstCard = game.cards[self.flippedCards.first!.tag]
                    let secondCard = game.cards[self.flippedCards.last!.tag]
                    
                    // if the cards are similar
                    if game.checkCards(firstCard, secondCard) {
                        // first hide them anonymous
                        UIView.animate(withDuration: 0.3) {
                            self.flippedCards.first!.layer.opacity = 0
                            self.flippedCards.last!.layer.opacity = 0
                        // then deleting them from the hierarchy
                        } completion: { _ in
                            self.flippedCards.first!.removeFromSuperview()
                            self.flippedCards.last!.removeFromSuperview()
                            self.flippedCards = []
                        }
                    } else {
                        // flip the cards back
                        for card in self.flippedCards {
                            (card as! FlippableView).flip()
                        }
                    }
                }
            }
        }
        return cardsViews
    }
    
    private func placeCardsOnBoard(_ cards: [UIView]) {
        // deleting all cards from the playing field
        for card in cardViews {
            card.removeFromSuperview()
        }
        cardViews = cards
        // cards iteration
        for card in cardViews {
            // random coordinates generating for each card
            let randomXCoordinate = Int.random(in: 0...cardMaxXCoordinate)
            let randomYCoordinate = Int.random(in: 0...cardMaxYCoordinate)
            card.frame.origin = CGPoint(x: randomXCoordinate, y: randomYCoordinate)
            // place the card on the playing field
            boardGameView.addSubview(card)
        }
    }

}
