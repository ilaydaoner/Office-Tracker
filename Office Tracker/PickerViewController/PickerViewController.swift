//
//  PickerViewController.swift
//  Office Tracker
//
//  Created by Mac on 15.08.2022.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let textFieldPickerVİew = UIPickerView()
    var capacityFilter: [String] = [String]()
    var roomFilter: [String] = [String]()
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch pickerView {
    case firstPicerView:
        return capacityFilter.count
    case textFieldPickerVİew:
        return roomFilter.count
    default:
        return 0
    }
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch pickerView {
    case firstPicerView:
        return capacityFilter[row]
    case textFieldPickerVİew:
        return roomFilter[row]
    default:
        return ""
}
}
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch pickerView {
      case firstPicerView:
    platformLabel.text = capacityFilter[row]
    case textFieldPickerVİew:
    firstTextField.text = roomFilter[row]
    default:break
}
}
    @IBOutlet weak var platformLabel: UILabel!
    
    @IBOutlet weak var firstPicerView: UIPickerView!

    @IBOutlet weak var firstTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstPicerView.delegate = self
        firstPicerView.dataSource = self
        textFieldPickerVİew.delegate = self
        textFieldPickerVİew.dataSource = self
        
        firstTextField.inputView = textFieldPickerVİew
        createToolbarForPickerVİew()
    }
      
    private func createToolbarForPickerVİew() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        let doneButton = UIBarButtonItem(title: "Bitti", style: .done, target: self, action: #selector(dismissButton))
        
        toolBar.setItems([doneButton], animated: false)
        firstTextField.inputAccessoryView = toolBar
    }
    @objc func dismissButton() {
        view.endEditing(true)
        
        
    
    }
}

