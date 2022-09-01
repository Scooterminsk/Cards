//
//  Card.swift
//  Cards
//
//  Created by Zenya Kirilov on 10.08.22.
//

import Foundation
import UIKit

// card type
enum CardType: CaseIterable {
    case circle
    case unfilledCircle
    case cross
    case square
    case fill
}

// available card types array
var availableCardTypes: [CardType] = [.circle, .unfilledCircle, .cross, .square, .fill]

// card color
enum CardColor: CaseIterable {
    case red
    case green
    case black
    case gray
    case brown
    case yellow
    case purple
    case orange
}

// available card colors array
var availableCardColors: [CardColor] = [.red, .green, .black, .gray, .brown, .yellow, .purple, .orange]

// playing card
typealias Card = (type: CardType, color: CardColor)

// shows if all cards are flipped
var allCardsFlipped = false
