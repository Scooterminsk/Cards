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
    case cross
    case square
    case fill
}

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

// playing card
typealias Card = (type: CardType, color: CardColor)

