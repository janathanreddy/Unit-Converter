//
//  ViewController.swift
//  UnitConvert
//
//  Created by Janarthan Subburaj on 28/01/21.
//

import UIKit

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
}

extension String {
    func isValidDouble(maxDecimalPlaces: Int) -> Bool {

        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        let decimalSeparator = formatter.decimalSeparator ?? "."
        
        if formatter.number(from: self) != nil {
            let split = self.components(separatedBy: decimalSeparator)
            let digits = split.count == 2 ? split.last ?? "" : ""
            return digits.count <= maxDecimalPlaces
        }
        return false
    }
}

class WeightViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var Gram: UITextField!
    @IBOutlet weak var KiloGram: UITextField!
    
    @IBOutlet weak var Ounce: UITextField!
    @IBOutlet weak var Pound: UITextField!
    let weightConverter = WeightConverter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        self.Gram.delegate = self
        self.KiloGram.delegate = self
        self.Ounce.delegate = self
        self.Pound.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GranCha(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let gram = Double(value)
            let values = weightConverter.gramConverter(gram: gram!)

            KiloGram.text = String(values.kg)
            Pound.text = String(values.pound)
            Ounce.text = String(values.ounce)
            
        }else{
            resetFields()
        }
    }
    
  
    
    @IBAction func KG(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let kg = Double(value)
            let values = weightConverter.kgConverter(kg: kg!)
            
            Gram.text = String(values.gram)
            Pound.text = String(values.pound)
            Ounce.text = String(values.ounce)
            
        }else{
            resetFields()
        }
    }
    
    
    @IBAction func PoundDidChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let pound = Double(value)
            let values = weightConverter.poundConverter(pound: pound!)
            
            Gram.text = String(values.gram)
            KiloGram.text = String(values.kg)
            Ounce.text = String(values.ounce)
            
        }else{
            resetFields()
        }
    }
    
    
    @IBAction func OunceChanged(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let ounce = Double(value)
            let values = weightConverter.ounceConverter(ounce: ounce!)
            
            Gram.text = String(values.gram)
            KiloGram.text = String(values.kg)
            Pound.text = String(values.pound)
            
        }else{
            resetFields()
        }
    }
   
    func resetFields() -> () {
        Gram.text = ""
        KiloGram.text = ""
        Pound.text = ""
        Ounce.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
    


}

