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
        if let resultData = storage.object(forKey: storageKey) as? Data,
           let result = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: [UIView.self as AnyClass], from: resultData) as? [UIView] {
            return result
        }
        return emptyArr
    }
    
    func saveCardViews(views: [UIView]) {
        let archivedViews = try? NSKeyedArchiver.archivedData(withRootObject: views, requiringSecureCoding: false)
        storage.set(archivedViews, forKey: storageKey)
    }
}
