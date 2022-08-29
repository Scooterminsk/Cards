//
//  CardColoursController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class CardColoursController: UITableViewController {

    // back button
    lazy var backButton = getSaveButton()
    
    override func loadView() {
        super.loadView()
        
        self.title = "Цвета фигур"
        self.navigationItem.rightBarButtonItem = backButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
       
        self.tableView.isScrollEnabled = false
        self.tableView.allowsSelection = false
       
    }
    
    private func getSaveButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(goBackAndSave(_:)))
        
        return button
    }
    
    @objc func goBackAndSave(_ sender: UIBarButtonItem) {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            configuration.text = "Красный"
        case 1:
            configuration.text = "Зеленый"
        case 2:
            configuration.text = "Черный"
        case 3:
            configuration.text = "Серый"
        case 4:
            configuration.text = "Коричневый"
        case 5:
            configuration.text = "Желтый"
        case 6:
            configuration.text = "Фиолетовый"
        case 7:
            configuration.text = "Оранжевый"
        case 8:
            configuration.text = "Белый"
        default:
            break
        }
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        cell.accessoryView = mySwitch
        cell.contentConfiguration = configuration

        return cell
    }

}
