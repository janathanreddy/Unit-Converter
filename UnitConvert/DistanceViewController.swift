//
//  DistanceViewController.swift
//  UnitConvert
//
//  Created by Janarthan Subburaj on 28/01/21.
//

import UIKit

class DistanceViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var MetreText: UITextField!
    @IBOutlet weak var FootText: UITextField!
    @IBOutlet weak var YardText: UITextField!
    @IBOutlet weak var KilometreText: UITextField!
    @IBOutlet weak var MileText: UITextField!
    let distanceConverter = DistanceConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        MetreText.delegate = self
        FootText.delegate = self
        YardText.delegate = self
        KilometreText.delegate = self
        MileText.delegate = self

    }
    
    @IBAction func MetreChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let metre = Double(value)
            let values = distanceConverter.metreConverter(metre: metre!)
            
            FootText.text = String(values.foot)
            YardText.text = String(values.yard)
            KilometreText.text = String(values.km)
            MileText.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func FootChange(_ sender: UITextField) {
        
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let foot = Double(value)
            let values = distanceConverter.footConverter(foot: foot!)
            
            MetreText.text = String(values.metre)
            YardText.text = String(values.yard)
            KilometreText.text = String(values.km)
            MileText.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    
    @IBAction func YardChanged(_ sender: UITextField) {
        
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let yard = Double(value)
            let values = distanceConverter.yardConverter(yard: yard!)
            
            MetreText.text = String(values.metre)
            FootText.text = String(values.foot)
            KilometreText.text = String(values.km)
            MileText.text = String(values.mile)
            
        }else{
            resetFields()
        }
        
    }
    
    @IBAction func KilometreChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let km = Double(value)
            let values = distanceConverter.kmConverter(km: km!)
            
            MetreText.text = String(values.metre)
            FootText.text = String(values.foot)
            YardText.text = String(values.yard)
            MileText.text = String(values.mile)
            
        }else{
            resetFields()
        }
    }
    
    @IBAction func MileChange(_ sender: UITextField) {
        let value = sender.text!
        
        if(!value.isEmpty){
            
            let mile = Double(value)
            let values = distanceConverter.mileConverter(mile: mile!)
            
            MetreText.text = String(values.metre)
            FootText.text = String(values.foot)
            YardText.text = String(values.yard)
            KilometreText.text = String(values.km)
            
        }else{
            resetFields()
        }
    }
    
    
    
    func resetFields() -> () {
        MetreText.text = ""
        FootText.text = ""
        YardText.text = ""
        KilometreText.text = ""
        MileText.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }
        
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return replacementText.isValidDouble(maxDecimalPlaces: 4)
    }
}
