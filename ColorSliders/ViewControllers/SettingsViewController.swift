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
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        setViewColor()
        
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setViewColor()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(viewColor)
        dismiss(animated: true)
    }
    
    
    // MARK: - Private methods
    private func setValue(for sliders: UISlider...) {

        let ciColor = CIColor(color: viewColor)
        sliders.forEach { slider in
            switch slider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: redLabel.text = string(from: redSlider)
            case greenLabel: greenLabel.text = string(from: greenSlider)
            default: blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: redSlider)
            case greenTextField: textField.text = string(from: greenSlider)
            default: textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        viewColor = colorView.backgroundColor
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else { return }
        guard let floatValue = Float(text) else { return }
        
        switch textField {
        case redTextField:
            redSlider.setValue(floatValue, animated: true)
            setValue(for: redLabel)
        case greenTextField:
            greenSlider.setValue(floatValue, animated: true)
            setValue(for: greenLabel)
        default:
            blueSlider.setValue(floatValue, animated: true)
            setValue(for: blueLabel)
        }
        setViewColor()
        viewColor = colorView.backgroundColor
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
