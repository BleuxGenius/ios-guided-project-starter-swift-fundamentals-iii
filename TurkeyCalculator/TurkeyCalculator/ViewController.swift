//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets connects the buttons and labels that are on the specifc scene
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions connects the buttons and labels that are on the specifc scene
//     textfield.text dispays the actaul text of what the user will imput in the text field.
//     guard let is used because its critical information. it needs to be refrenced outside the scope of its braces
//     return means to finish the method then Exit
    
    
//     when the button is tapped , the user is requesting information then waiting for the action to run.
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let turkeyWeightString = turkeyWeightTextField.text else {
            return
        }
//         converting/validating the string to a double, if the string doesnt convert to a double it will return and print invalid number. and exit the method
        guard let turkeyWeight = Double(turkeyWeightString) else {
            print("Invalid number")
            return
        }
        
        var durationInMinutes: Double
            
        if metricButton.isSelected{
            durationInMinutes = cookTimeInKilograms(turkeyWeight)
        } else {
            durationInMinutes = cookTimeInPounds(turkeyWeight)
        }
        
//         what if we wanted to print the number of hours ?
        
        cookTimeTextField.text = "\(durationInMinutes / 60.0) hours"
    }
//     sender is the object that tapped the button to run this action, isSelected is either true or false its a boolean. toggle flips it on or off
    
    @IBAction func metricButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    // Helper functions
//     creating the function to do the work that converts pounds to minutes
    func cookTimeInPounds(_ weight: Double) -> Double {
        let durationInMinutes = weight * 15.0
        return durationInMinutes
    }
    
    func cookTimeInKilograms(_ weight: Double) -> Double {
        var durationInMinutes: Double
        
        if weight >= 4 {
            durationInMinutes = 20.0 * weight + 90
        } else {
            durationInMinutes = 20.0 * weight + 70
        }
        
        return durationInMinutes
    }
}
