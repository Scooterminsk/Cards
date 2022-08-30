//
//  BackShapesController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class BackShapesController: UITableViewController {
    
    // switches
    let circlesSwitch = UISwitch()
    let linesSwitch = UISwitch()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        circlesSwitch.isOn = backShapes.contains("circle") ? true : false
        linesSwitch.isOn = backShapes.contains("line") ? true : false
        
    }
    
    private func getBackButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(goBackAndSave(_:)))
        
        return button
    }
    
    @objc func goBackAndSave (_ sender: UIBarButtonItem) {
        var newBackShapes = [String]()
        let switches = [circlesSwitch, linesSwitch]
        
        if switches.allSatisfy({ mySwitch in mySwitch.isOn == false }) {
            let alert = UIAlertController(title: "Стой!", message: "Необходимо выбрать хотя бы 1 узор", preferredStyle: .alert)
            let action = UIAlertAction(title: "Назад", style: .cancel)
            alert.addAction(action)
            
            self.present(alert, animated: true)
            return
        }
        
        if circlesSwitch.isOn && !newBackShapes.contains("circle") {
            newBackShapes.append("circle")
        }
        if linesSwitch.isOn && !newBackShapes.contains("line") {
            newBackShapes.append("line")
        }
        
        backShapes = newBackShapes
        self.navigationController?.popViewController(animated: true)
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
            cell.accessoryView = circlesSwitch
            configuration.text = "Круги"
        case 1:
            cell.accessoryView = linesSwitch
            configuration.text = "Линии"
        default:
            break
        }

        cell.contentConfiguration = configuration

        return cell
    }
    
}
