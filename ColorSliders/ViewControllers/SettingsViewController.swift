//
//  SettingsViewController.swift
//  ColorSliders
//
//  Created by Aleksei Voronovskii on 11/21/22.
//

import UIKit

class SettingsViewController: UIViewController {
            
    // MARK: - IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    var color: UIColor!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        setSlidersValue(for: redSlider, greenSlider, blueSlider, as: color)
        setViewColor()
        setRGBLabelsValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }

    // MARK: - IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setViewColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = getSliderStringValue(from: redSlider)
        case greenSlider:
            greenValueLabel.text = getSliderStringValue(from: greenSlider)
        default:
            blueValueLabel.text = getSliderStringValue(from: blueSlider)
        }
    }
    
//    @IBAction func rgbTextFieldAction(_ sender: UITextField) {
//        setViewColor()
//
//    }
    
    
    // MARK: - Private methods
    private func setSlidersValue(for sliders: UISlider..., as color: UIColor) {
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(color.ciColor.red)
            case greenSlider:
                greenSlider.value = Float(color.ciColor.green)
            default:
                blueSlider.value = Float(color.ciColor.blue)
            }
        }
    }
    
    private func setRGBLabelsValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = getSliderStringValue(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = getSliderStringValue(from: greenSlider)
            default:
                blueValueLabel.text = getSliderStringValue(from: blueSlider)
            }
        }
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func getSliderStringValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
//    private func getTextFieldStringValue(from textField: UITextField) -> String {
//        if Double(textField.text) < 0 {
//            textField.text = "0"
//        }
//        if Double(textField.text) > 1 {
//            textField.text = "1.0"
//        }
//        String(format: "%.2f", textField.text)
//    }
}

