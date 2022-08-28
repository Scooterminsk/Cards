//
//  Game.swift
//  Cards
//
//  Created by Zenya Kirilov on 10.08.22.
//

import Foundation

class Game {
    
    // pair of unique cards count
    var cardsCount = 8 {
        didSet {
            print(cardsCount)
        }
    }
    
    // an array of generated cards
    var cards = [Card]()
    
    // random cards array generation
    func generateCards() {
        // new cards array generation
        var cards = [Card]()
        let cardsCount1 = cardsCount
        for _ in 0...cardsCount1 - 1 {
            let randomElement = (type: CardType.allCases.randomElement()!, color: CardColor.allCases.randomElement()!)
            cards.append(randomElement)
        }
        self.cards = cards
        print(cardsCount1)
    }
    
    // cards equality check
    func checkCards(_ firstCard: Card, _ secondCard: Card) -> Bool {
        if firstCard == secondCard {
            return true
        }
        return false
    }
}
