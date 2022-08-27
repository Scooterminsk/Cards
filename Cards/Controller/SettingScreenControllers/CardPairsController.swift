//
//  CardPairsController.swift
//  Cards
//
//  Created by Zenya Kirilov on 27.08.22.
//

import UIKit

class CardPairsController: UIViewController {

    // picker view entity
    lazy var pickerView = getPickerView()
    
    // right navigation bar button entity
    lazy var rightNavigationBarButton = getRightNavigationBarButton()
    
    // completion handler
    var completionHandler: ((Int) -> Void)?
    
    override func loadView() {
        super.loadView()
        
        // set the title
        self.title = "Количество пар карт"
        
        // add picker view on the scene
        self.view.addSubview(pickerView)
        
        // right navigation bar item button add
        self.navigationItem.rightBarButtonItem = rightNavigationBarButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
    
    // MARK: - Picker view creation
    
    private func getPickerView() -> UIPickerView {
        // picker view creation
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        // changing picker view coordinates
        pickerView.center.x = view.center.x
        pickerView.center.y = view.frame.midY - 190
        
        // sighning on protocols
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return pickerView
        
    }
    
    // MARK: - Add right navigation bar button
    
    private func getRightNavigationBarButton() -> UIBarButtonItem {
        // button creation
        let button = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(savePairsCount(_:)))
        
        return button
    }
    
    @objc func savePairsCount(_ sender: UIBarButtonItem) {
        let selectedNumber = pickerView.selectedRow(inComponent: 0)
        completionHandler?(selectedNumber)
        self.navigationController?.popViewController(animated: true)
    }

    
    
}

extension CardPairsController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
}

extension CardPairsController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
}
