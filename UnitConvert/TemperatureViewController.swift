//
//  TemperatureViewController.swift
//  UnitConvert
//
//  Created by Janarthan Subburaj on 28/01/21.
//

import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var CelsiusText: UITextField!
    
    @IBOutlet weak var KelvinText: UITextField!
    @IBOutlet weak var FahrenheitText: UITextField!
    let temperatureConverter = TemperatureConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        self.CelsiusText.delegate = self
        self.FahrenheitText.delegate = self
        self.KelvinText.delegate = self


    }
    
    @IBAction func CelsiusChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let celsius = Double(value)
            let values = temperatureConverter.celsiusConverter(celsius: celsius!)
            
            FahrenheitText.text = String(values.fahrenheit)
            KelvinText.text = String(values.kelvin)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func FahrenheitChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let fahrenheit = Double(value)
            let values = temperatureConverter.fahrenheitConverter(fahrenheit: fahrenheit!)
            
            CelsiusText.text = String(values.celsius)
            KelvinText.text = String(values.kelvin)
            
        }else{
            resetFields()
        }
    }
    @IBAction func KelvinChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let kelvin = Double(value)
            let values = temperatureConverter.kelvinConverter(kelvin: kelvin!)
            
            CelsiusText.text = String(values.celsius)
            FahrenheitText.text = String(values.fahrenheit)
            
        }else{
            resetFields()
        }
    }
    
    
    func resetFields() -> () {
        CelsiusText.text = ""
        FahrenheitText.text = ""
        KelvinText.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }

}
