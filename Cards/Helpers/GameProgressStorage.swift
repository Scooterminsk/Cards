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
    func saveCardViews(progress: GameProgress)
    
}

class GameStorage: GameProgressStorageProtocol {

    // storage reference
    private var storage = UserDefaults.standard
    
    // storage key
    private var storageKey = "cardViews"
    
    func loadCardViews() -> [UIView] {
        let emptyArr = [UIView]()
        if let resultData = storage.data(forKey: storageKey),
           let result = try? NSKeyedUnarchiver.unarchivedObject(ofClass: GameProgress.self, from: resultData) {
            return result.cardViews
        } else {
            return emptyArr
        }
    }
    
    func saveCardViews(progress: GameProgress) {
        let archivedProgress = try? NSKeyedArchiver.archivedData(withRootObject: progress, requiringSecureCoding: false)
        storage.set(archivedProgress, forKey: storageKey)
    }
}

class GameProgress: NSObject, NSCoding {
    
    // array of playing cards
    var cardViews = [UIView]() {
        didSet {
            print("Количество карт изменилось")
        }
    }
    
    override init() {
        super.init()
    }
    
    fileprivate enum UserSettings {
        static let cardViews = "cardViews"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self, forKey: UserSettings.cardViews)
    }
    
    required init?(coder: NSCoder) {
        coder.decodeObject(forKey: UserSettings.cardViews)
    }
    
}

