//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Sarah Mogin on 2/13/23.
//

import UIKit

class TempViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        updateCelsiusLabel()
        textField.delegate = self
        super.viewDidLoad()
    }
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheightValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheightValue {
            return fahrenheightValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
        super.viewDidAppear(animated)
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheightValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheightValue = nil
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator) != nil;
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator) != nil;
        return !(existingTextHasDecimalSeparator && replacementTextHasDecimalSeparator);
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

