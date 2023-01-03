//
//  SettingsViewController.swift
//  ColorSliders
//
//  Created by Aleksei Voronovskii on 11/21/22.
//

import UIKit

final class SettingsViewController: UIViewController {
            
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
    
    var delegate: SettingsViewControllerDelegate!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        setSlidersValue(for: redSlider, greenSlider, blueSlider, as: color)
        setRGBLabelsValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setTextFieldsValue(for: redTextField, greenTextField, blueTextField)
        setViewColor()
        
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
    }

    // MARK: - IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setViewColor()
        setRGBLabelsValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setTextFieldsValue(for: redTextField, greenTextField, blueTextField)
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setNewColor(for: color)
        dismiss(animated: true)
    }
    
    
    // MARK: - Private methods
    private func setSlidersValue(for sliders: UISlider..., as color: UIColor) {
        var redComponent: CGFloat = 0
        var greenComponent: CGFloat = 0
        var blueComponent: CGFloat = 0
        var alphaComponent: CGFloat = 0
        color.getRed(&redComponent, green: &greenComponent, blue: &blueComponent, alpha: &alphaComponent)
        
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(redComponent)
            case greenSlider:
                greenSlider.value = Float(greenComponent)
            default:
                blueSlider.value = Float(blueComponent)
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
        color = colorView.backgroundColor
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
    
    private func setTextFieldsValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = getSliderStringValue(from: redSlider)
            case greenTextField:
                greenTextField.text = getSliderStringValue(from: greenSlider)
            default:
                blueTextField.text = getSliderStringValue(from: blueSlider)
            }
        }
    }
    
    private func getSliderStringValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        var redComponent: CGFloat = 0
        var greenComponent: CGFloat = 0
        var blueComponent: CGFloat = 0
        var alphaComponent: CGFloat = 0
        color.getRed(&redComponent, green: &greenComponent, blue: &blueComponent, alpha: &alphaComponent)
        
        guard let newValue = textField.text else { return }
        guard let floatValue = Float(newValue) else { return }
        let cgFloatValue = CGFloat(floatValue)
        
        if textField == redTextField {
            setAllValues(red: cgFloatValue, green: greenComponent, blue: blueComponent)
        } else if textField == greenTextField {
            setAllValues(red: redComponent, green: cgFloatValue, blue: blueComponent)
        } else {
            setAllValues(red: redComponent, green: greenComponent, blue: cgFloatValue)
        }
    }
    
    private func setAllValues(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorView.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
        color = colorView.backgroundColor
        setSlidersValue(for: redSlider, greenSlider, blueSlider, as: color)
        setRGBLabelsValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setTextFieldsValue(for: redTextField, greenTextField, blueTextField)
    }
}
