//
//  CardViewFactory.swift
//  Cards
//
//  Created by Zenya Kirilov on 11.08.22.
//

import Foundation
import UIKit

class CardViewFactory {
    func get(_ shape: CardType, withSize size: CGSize, andColor color: CardColor) -> UIView {
        // according to size setting a frame
        let frame = CGRect(origin: .zero, size: size)
        // setting UIColor according to color in the model
        let viewColor = getViewColorBy(modelColor: color)
        // created new var to make some changes with shapes before their returning
        var resultingShape: UIView
        
        // generating and returning a card
        switch shape {
        case .circle:
            resultingShape = CardView<CircleShape>(frame: frame, color: viewColor)
            return resultingShape
        case .unfilledCircle:
            resultingShape = CardView<CircleShape>(frame: frame, color: .white)
            return resultingShape
        case .cross:
            resultingShape = CardView<CrossShape>(frame: frame, color: viewColor)
            return resultingShape
        case .square:
            resultingShape = CardView<SquareShape>(frame: frame, color: viewColor)
            return resultingShape
        case .fill:
            resultingShape = CardView<FillShape>(frame: frame, color: viewColor)
            return resultingShape
        }
    }
    
    // changing Medel color into View color
    private func getViewColorBy(modelColor: CardColor) -> UIColor {
        switch modelColor {
        case .red:
            return .red
        case .green:
            return .green
        case .black:
            return .black
        case .gray:
            return .gray
        case .brown:
            return .brown
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        case .orange:
            return .orange
        }
    }
}
