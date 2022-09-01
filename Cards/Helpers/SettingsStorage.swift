//
//  Storage.swift
//  Cards
//
//  Created by Zenya Kirilov on 31.08.22.
//

import Foundation
import UIKit

protocol SettingsStorageProtocol {
    // loading and saving of card pairs count from settings
    func loadCardPairsCount() -> Int
    func saveCardPairsCount(count: Int)
    
    // loading and saving of card types from settings
    func loadCardTypes() -> [CardType]
    func saveCardTypes(types: [CardType])
    
    // loading and saving of card colors from settings
    func loadCardColors() -> [CardColor]
    func saveCardColors(colors: [CardColor])
    
    // loading and saving of back shapes from settings
    func loadBackShapes() -> [String]
    func saveBackShapes(shapes: [String])
}

class SettingsStorage: SettingsStorageProtocol {
    // storage reference
    private var storage = UserDefaults.standard
    
    // storage key for pairs of equal cards
    private var storageKeyCardPairs = "cardPairs"
    // storage key for card types
    private var storageKeyCardTypes = "cardTypes"
    // storage key for card colors
    private var storageKeyCardColors = "cardColors"
    // storage key for back side shapes
    private var storageKeyBackShapes = "backShapes"
    
    // MARK: - functions for card pairs count
    func loadCardPairsCount() -> Int {
        var result = 8
        let dataFromStorage = storage.integer(forKey: storageKeyCardPairs)
        guard dataFromStorage > 0 else {
            return result
        }
        result = dataFromStorage
        return result
    }
    
    func saveCardPairsCount(count: Int) {
        storage.set(count, forKey: storageKeyCardPairs)
    }
    
    // MARK: - functions for available card types
    func loadCardTypes() -> [CardType] {
        var result: [CardType] = [.circle, .unfilledCircle, .cross, .square, .fill]
        var tmp = [CardType]()
        let dataFromStorage = storage.array(forKey: storageKeyCardTypes)
        
        guard let resultArr = dataFromStorage as? [String] else {
            return result
        }
        
        for type in resultArr {
            switch type {
            case "circle":
                tmp.append(.circle)
            case "unfilledCircle":
                tmp.append(.unfilledCircle)
            case "cross":
                tmp.append(.cross)
            case "square":
                tmp.append(.square)
            case "fill":
                tmp.append(.fill)
            default:
                break
            }
        }
        result = tmp
        return result
    }
    
    func saveCardTypes(types: [CardType]) {
        var arrayForStorage = [String]()
        for type in types {
            switch type {
            case .circle:
                arrayForStorage.append("circle")
            case .unfilledCircle:
                arrayForStorage.append("unfilledCircle")
            case .cross:
                arrayForStorage.append("cross")
            case .square:
                arrayForStorage.append("square")
            case .fill:
                arrayForStorage.append("fill")
            }
        }
        storage.set(arrayForStorage, forKey: storageKeyCardTypes)
    }
    
    // MARK: - functions for available card colors
    func loadCardColors() -> [CardColor] {
        var result: [CardColor] = [.red, .green, .black, .gray, .brown, .yellow, .purple, .orange]
        var tmp = [CardColor]()
        let dataFromStorage = storage.array(forKey: storageKeyCardColors)
        
        guard let resultArr = dataFromStorage as? [String] else {
            return result
        }
        
        for color in resultArr {
            switch color {
            case "red":
                tmp.append(.red)
            case "green":
                tmp.append(.green)
            case "black":
                tmp.append(.black)
            case "gray":
                tmp.append(.gray)
            case "brown":
                tmp.append(.brown)
            case "yellow":
                tmp.append(.yellow)
            case "purple":
                tmp.append(.purple)
            case "orange":
                tmp.append(.orange)
            default:
                break
            }
        }
        result = tmp
        return result
    }
    
    func saveCardColors(colors: [CardColor]) {
        var arrayForStorage = [String]()
        for color in colors {
            switch color {
            case .red:
                arrayForStorage.append("red")
            case .green:
                arrayForStorage.append("green")
            case .black:
                arrayForStorage.append("black")
            case .gray:
                arrayForStorage.append("gray")
            case .brown:
                arrayForStorage.append("brown")
            case .yellow:
                arrayForStorage.append("yellow")
            case .purple:
                arrayForStorage.append("purple")
            case .orange:
                arrayForStorage.append("orange")
            }
        }
        storage.set(arrayForStorage, forKey: storageKeyCardColors)
    }
    
    // MARK: - Functions for available back shapes
    func loadBackShapes() -> [String] {
        let result = ["circle", "line"]
        let dataFromStorage = storage.array(forKey: storageKeyBackShapes) as? [String]
        guard let resultArr = dataFromStorage else {
            return result
        }
        return resultArr
    }
    
    func saveBackShapes(shapes: [String]) {
        storage.set(shapes, forKey: storageKeyBackShapes)
    }
}
