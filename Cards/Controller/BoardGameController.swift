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

    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
