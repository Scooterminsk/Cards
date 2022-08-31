//
//  CardColoursController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class CardColoursController: UITableViewController {
    
    // user defaults storage
    var storage: SettingsStorageProtocol!
    
    // switches
    let redSwitch = UISwitch()
    let greenSwitch = UISwitch()
    let blackSwitch = UISwitch()
    let graySwitch = UISwitch()
    let brownSwitch = UISwitch()
    let yellowSwitch = UISwitch()
    let purpleSwitch = UISwitch()
    let orangeSwitch = UISwitch()
    
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
        
        storage = SettingsStorage()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        redSwitch.isOn = availableCardColors.contains(.red) ? true : false
        greenSwitch.isOn = availableCardColors.contains(.green) ? true : false
        blackSwitch.isOn = availableCardColors.contains(.black) ? true : false
        graySwitch.isOn = availableCardColors.contains(.gray) ? true : false
        brownSwitch.isOn = availableCardColors.contains(.brown) ? true : false
        yellowSwitch.isOn = availableCardColors.contains(.yellow) ? true : false
        purpleSwitch.isOn = availableCardColors.contains(.purple) ? true : false
        orangeSwitch.isOn = availableCardColors.contains(.orange) ? true : false
    }
   
    // MARK: - Add right navigation bar button
    private func getSaveButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(goBackAndSave(_:)))
        
        return button
    }
    
    @objc func goBackAndSave(_ sender: UIBarButtonItem) {
        var newAvailableCardColors: [CardColor] = []
        let switches = [redSwitch, greenSwitch, blackSwitch, graySwitch, brownSwitch, yellowSwitch, purpleSwitch, orangeSwitch]
        let colors: [CardColor] = [.red, .green, .black, .gray, .brown, .yellow, .purple, .orange]
        
        if switches.allSatisfy({ mySwitch in mySwitch.isOn == false }) {
            let alert = UIAlertController(title: "Стой!", message: "Необходимо выбрать хотя бы 1 цвет", preferredStyle: .alert)
            let action = UIAlertAction(title: "Назад", style: .cancel)
            alert.addAction(action)
            
            self.present(alert, animated: true)
            return
        }
        
        for mySwitch in switches {
            if mySwitch.isOn && !newAvailableCardColors.contains(colors[switches.firstIndex(of: mySwitch)!]) {
                newAvailableCardColors.append(colors[switches.firstIndex(of: mySwitch)!])
            }
        }
        
        storage.saveCardColors(colors: newAvailableCardColors)
        availableCardColors = newAvailableCardColors
        self.navigationController?.popViewController(animated: true)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            cell.accessoryView = redSwitch
            configuration.text = "Красный"
        case 1:
            cell.accessoryView = greenSwitch
            configuration.text = "Зеленый"
        case 2:
            cell.accessoryView = blackSwitch
            configuration.text = "Черный"
        case 3:
            cell.accessoryView = graySwitch
            configuration.text = "Серый"
        case 4:
            cell.accessoryView = brownSwitch
            configuration.text = "Коричневый"
        case 5:
            cell.accessoryView = yellowSwitch
            configuration.text = "Желтый"
        case 6:
            cell.accessoryView = purpleSwitch
            configuration.text = "Фиолетовый"
        case 7:
            cell.accessoryView = orangeSwitch
            configuration.text = "Оранжевый"
        default:
            break
        }
        
        cell.contentConfiguration = configuration

        return cell
    }

}
