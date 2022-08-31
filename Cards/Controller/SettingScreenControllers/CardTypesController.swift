//
//  CardTypesController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class CardTypesController: UITableViewController {
    
    // user defaults storage
    var storage: SettingsStorageProtocol!
    
    // switches
    let circleSwitch = UISwitch()
    let unfilledCircleSwitch = UISwitch()
    let squareSwitch = UISwitch()
    let crossSwitch = UISwitch()
    let fillSwitch = UISwitch()
    
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
        
        storage = SettingsStorage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        circleSwitch.isOn = availableCardTypes.contains(.circle) ? true : false
        unfilledCircleSwitch.isOn = availableCardTypes.contains(.unfilledCircle) ? true : false
        squareSwitch.isOn = availableCardTypes.contains(.square) ? true : false
        crossSwitch.isOn = availableCardTypes.contains(.cross) ? true : false
        fillSwitch.isOn = availableCardTypes.contains(.fill) ? true: false
    }

    private func getSaveButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveAndGoBack(_:)))
        
        return button
    }
    
    @objc func saveAndGoBack(_ sender: UIBarButtonItem) {
        
        var newAvailableCardTypes: [CardType] = []
        let switches = [circleSwitch, unfilledCircleSwitch, squareSwitch, crossSwitch, fillSwitch]
        let myTypes: [CardType] = [.circle, .unfilledCircle, .square, .cross, .fill]
        
        if switches.allSatisfy({ mySwitch in mySwitch.isOn == false}) {
            let alert = UIAlertController(title: "Стой!", message: "Необходимо выбрать хотя бы 1 фигуру", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Назад", style: .cancel)
            alert.addAction(alertAction)
            
            self.present(alert, animated: true)
            return
        }
        
        for mySwitch in switches {
            if mySwitch.isOn && !newAvailableCardTypes.contains(myTypes[switches.firstIndex(of: mySwitch)!]) {
                newAvailableCardTypes.append(myTypes[switches.firstIndex(of: mySwitch)!])
            }
        }
        
        storage.saveCardTypes(types: newAvailableCardTypes)
        availableCardTypes = newAvailableCardTypes
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            cell.accessoryView = circleSwitch
            configuration.text = "Круг"
        case 1:
            cell.accessoryView = unfilledCircleSwitch
            configuration.text = "Незакрашенный круг"
        case 2:
            cell.accessoryView = squareSwitch
            configuration.text = "Квадрат"
        case 3:
            cell.accessoryView = crossSwitch
            configuration.text = "Крест"
        case 4:
            cell.accessoryView = fillSwitch
            configuration.text = "Сплошное заполнение"
        default:
            break
        }
        cell.contentConfiguration = configuration
        return cell
    }
    
}
