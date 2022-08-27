//
//  EditScreenController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class EditScreenController: UITableViewController {

    // cells creation without using storyboard
    var pairsCountCell = UITableViewCell()
    var cardTypeChoosingCell = UITableViewCell()
    var cardColoursChoosingCell = UITableViewCell()
    var backSideShapesChoosingCell = UITableViewCell()
    
    // settings view controllers entities
    lazy var cardPairsController = CardPairsController()
    lazy var cardTypesController = CardTypesController()
    lazy var cardColoursController = CardColoursController()
    lazy var backShapesController = BackShapesController()
    

    // updated data properties
    var cardPairsUpdated: Int?
    
    override func loadView() {
        super.loadView()
        
        // set the title
        self.title = "Настройки игры"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // unabling scroll
        self.tableView.isScrollEnabled = false
        
        // back bar button item changing
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = pairsCountCell
        case 1:
            cell = cardTypeChoosingCell
        case 2:
            cell = cardColoursChoosingCell
        case 3:
            cell = backSideShapesChoosingCell
        default:
            break
        }

        // cells configuration
        var configuration = cell.defaultContentConfiguration()
        
        switch cell {
        case pairsCountCell:
            configuration.text = "Выберите количество пар одинаковых карт"
            configuration.secondaryText = "Выберите число от 1 до 20"
        case cardTypeChoosingCell:
            configuration.text = "Выберите тип карт, используемые в игре"
        case cardColoursChoosingCell:
            configuration.text = "Выберите цвета карт, используемые в игре"
        case backSideShapesChoosingCell:
            configuration.text = "Выберите узоры обратной стороны карт, исползуемые в игре"
        default:
            break
        }

        cell.contentConfiguration = configuration
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            cardPairsController.completionHandler = { [unowned self] updatedValue in
                cardPairsUpdated = updatedValue
            }
            self.navigationController?.pushViewController(cardPairsController, animated: true)
        case 1:
            self.navigationController?.pushViewController(cardTypesController, animated: true)
        case 2:
            self.navigationController?.pushViewController(cardColoursController, animated: true)
        case 3:
            self.navigationController?.pushViewController(backShapesController, animated: true)
        default:
            break
        }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    
}
