//
//  CardTypesController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class CardTypesController: UITableViewController {
    
    // save button
    lazy var saveButton = getSaveButton()
    
    override func loadView() {
        super.loadView()
        
        self.title = "Типы фигур в игре"
        
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.tableView.isScrollEnabled = false
        self.tableView.allowsSelection = false
        
    }

    private func getSaveButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveAndGoBack(_:)))
        
        return button
    }
    
    @objc func saveAndGoBack(_ sender: UIBarButtonItem) {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            configuration.text = "Круг"
        case 1:
            configuration.text = "Квадрат"
        case 2:
            configuration.text = "Крест"
        case 3:
            configuration.text = "Сплошное заполнение"
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
