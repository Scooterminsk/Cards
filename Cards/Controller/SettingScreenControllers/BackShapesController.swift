//
//  BackShapesController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class BackShapesController: UITableViewController {
    
    // right side navigation bar button
    lazy var goBackAndSaveButton = getBackButton()

    override func loadView() {
        super.loadView()
        
        self.title = "Задняя часть карт"
        self.navigationItem.rightBarButtonItem = goBackAndSaveButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.tableView.isScrollEnabled = false
        self.tableView.allowsSelection = false

    }
    
    private func getBackButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(goBackAndSave(_:)))
        
        return button
    }
    
    @objc func goBackAndSave (_ sender: UIBarButtonItem) {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            configuration.text = "Круги"
        case 1:
            configuration.text = "Линии"
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
