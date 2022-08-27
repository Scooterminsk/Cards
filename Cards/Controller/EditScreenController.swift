//
//  EditScreenController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class EditScreenController: UITableViewController {

    // static cells creation
    var pairsCountCell = UITableViewCell()
    var cardTypeChoosingCell = UITableViewCell()
    var cardColoursChoosingCell = UITableViewCell()
    var backSideShapesChoosingCell = UITableViewCell()

    
    override func loadView() {
        super.loadView()
        
        // set the title
        self.title = "Настройки игры"
        
        // construct pairs count cell, row 0
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // unabling scroll
        self.tableView.isScrollEnabled = false

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
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
