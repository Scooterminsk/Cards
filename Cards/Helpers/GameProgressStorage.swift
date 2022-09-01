//
//  GameProgressStorage.swift
//  Cards
//
//  Created by Zenya Kirilov on 1.09.22.
//

import Foundation
import UIKit

protocol GameProgressStorageProtocol {
    // loading and saving current card views
    func loadCardViews() -> [UIView]
    func saveCardViews(views: [UIView])
    
}

class GameStorage: GameProgressStorageProtocol {

    // storage reference
    private var storage = UserDefaults.standard
    
    // storage key
    private var storageKey = "views"
    
    func loadCardViews() -> [UIView] {
        let emptyArr = [UIView]()
        if let result = storage.array(forKey: storageKey) {
            return result as! [UIView]
        }
        return emptyArr
    }
    
    func saveCardViews(views: [UIView]) {
        storage.set(views, forKey: storageKey)
    }
}
