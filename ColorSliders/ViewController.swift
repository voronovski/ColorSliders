//
//  ViewController.swift
//  ColorSliders
//
//  Created by Aleksei Voronovskii on 11/21/22.
//

import UIKit

class ViewController: UIViewController {
            
    // MARK: IBOutlets
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        setViewColor()
        setRGBLabelsValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }

    // MARK: IBActions
    @IBAction func rgbSliderAction(_ sender: UISlider) {
        setViewColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = getStringValue(from: redSlider)
        case greenSlider:
            greenValueLabel.text = getStringValue(from: greenSlider)
        default:
            blueValueLabel.text = getStringValue(from: blueSlider)
        }
    }
    
    // MARK: Private methods
    private func setRGBLabelsValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = getStringValue(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = getStringValue(from: greenSlider)
            default:
                blueValueLabel.text = getStringValue(from: blueSlider)
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
    
    private func getStringValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

