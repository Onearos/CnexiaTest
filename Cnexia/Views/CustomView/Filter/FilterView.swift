//
//  FilterView.swift
//  Cnexia
//
//  Created by Macbook PRO on 21/09/2022.
//

import UIKit

protocol FilterViewDelegate: AnyObject {
    func didSelectMake(_ make: String)
    func didSelectModel(_ model: String)
}

struct FilterViewModel {
    static let empty: FilterViewModel = .init(title: .init(text: "", appearance: .init(font: nil, textColor: nil)),
                                              selectedMakeOption: "",
                                              anyMakeOptions: [],
                                              selectedModelOption: "",
                                              anyModelOptions: [])
    var title: LabelViewModel
    var selectedMakeOption: String
    var anyMakeOptions: [String]
    var selectedModelOption: String
    var anyModelOptions: [String]
}

final class FilterView: UIView, CustomView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var anyMakeDropdown: UITextField!
    private lazy var anyMakePicker = UIPickerView()
    @IBOutlet weak var anyModelDropdown: UITextField!
    private lazy var anyModelPicker = UIPickerView()
    private var anyMakeOptions: [String] = []
    private var anyModelOptions: [String] = []
    @IBOutlet weak var container: UIView!
    private lazy var toolbar: UIToolbar = {
        let tool = UIToolbar()
        tool.barStyle = .default
        tool.sizeToFit()
        
        let selectButton = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectButtonTapped))
        tool.setItems([selectButton], animated: false)
        return tool
    }()
    
    weak var delegate: FilterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXIB()
        setupDropDown()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadXIB()
        setupDropDown()
    }
    
    func setupDropDown() {
        container.layer.cornerRadius = 6
        container.layer.masksToBounds = true
        
        anyMakeDropdown.inputView = anyMakePicker
        anyMakeDropdown.inputAccessoryView = toolbar
        anyMakeDropdown.tintColor = .clear
        anyModelDropdown.inputView = anyModelPicker
        anyModelDropdown.inputAccessoryView = toolbar
        anyModelDropdown.tintColor = .clear
        anyMakePicker.delegate = self
        anyMakePicker.dataSource = self
        
        anyModelPicker.delegate = self
        anyModelPicker.dataSource = self
    }
    
    func setup(viewModel: FilterViewModel) {
        self.title.setup(viewModel: viewModel.title)
        anyMakeOptions = viewModel.anyMakeOptions
        anyModelOptions = viewModel.anyModelOptions
        anyMakePicker.reloadAllComponents()
        anyModelPicker.reloadAllComponents()
        anyModelDropdown.text = viewModel.selectedModelOption
        anyMakeDropdown.text = viewModel.selectedMakeOption
    }
    
    @objc func selectButtonTapped() {
        if anyMakeDropdown.isFirstResponder {
            delegate?.didSelectMake(anyMakeDropdown.text ?? "")
        } else if anyModelDropdown.isFirstResponder {
            delegate?.didSelectModel(anyModelDropdown.text ?? "")
        }
    }
}

extension FilterView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView === anyMakePicker {
            return anyMakeOptions.count
        } else if pickerView === anyModelPicker {
            return anyModelOptions.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView === anyMakePicker {
            return anyMakeOptions[row]
        } else if pickerView === anyModelPicker {
            return anyModelOptions[row]
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView === anyMakePicker {
            anyMakeDropdown.text = anyMakeOptions[row]
            
        } else if pickerView === anyModelPicker {
            anyModelDropdown.text = anyModelOptions[row]
        }
    }
}
