//
//  SpeedViewController.swift
//  UnitConvert
//
//  Created by Janarthan Subburaj on 28/01/21.
//

import UIKit

class SpeedViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var MetrePerSec: UITextField!
    
    @IBOutlet weak var FeetperMin: UITextField!
    
    @IBOutlet weak var KilometrePerHour: UITextField!
    
    @IBOutlet weak var MilePerHour: UITextField!
    let speedConverter = SpeedConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        MetrePerSec.delegate = self
        FeetperMin.delegate = self
        KilometrePerHour.delegate = self
        MilePerHour.delegate = self
    }
    
    @IBAction func MeterChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let metreSec = Double(value)
            let values = speedConverter.metreSecConverter(metre: metreSec!)
            
            FeetperMin.text = String(values.feet)
            KilometrePerHour.text = String(values.km)
            MilePerHour.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func FeetChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let feetMin = Double(value)
            let values = speedConverter.feetMinConverter(feet: feetMin!)
            
            MetrePerSec.text = String(values.metre)
            KilometrePerHour.text = String(values.km)
            MilePerHour.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func KilometerChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let kmHour = Double(value)
            let values = speedConverter.kmHourConverter(km: kmHour!)
            
            MetrePerSec.text = String(values.metre)
            FeetperMin.text = String(values.feet)
            MilePerHour.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func MileChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let mileHour = Double(value)
            let values = speedConverter.mileHourConverter(mile: mileHour!)
            
            MetrePerSec.text = String(values.metre)
            FeetperMin.text = String(values.feet)
            KilometrePerHour.text = String(values.km)
            
        }else{
            resetFields()
        }
    }
    func resetFields() -> () {
        MetrePerSec.text = ""
        FeetperMin.text = ""
        KilometrePerHour.text = ""
        MilePerHour.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
}
