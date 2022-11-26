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
    
    var redSenderValue: Float = 0.5
    var greenSenderValue: Float = 0.5
    var blueSenderValue: Float = 0.5
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        redValueLabel.text = String(format: "%.2f", redSenderValue)
        greenValueLabel.text = String(format: "%.2f", greenSenderValue)
        blueValueLabel.text = String(format: "%.2f", blueSenderValue)
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSenderValue),
            green: CGFloat(greenSenderValue),
            blue: CGFloat(blueSenderValue),
            alpha: 1
        )
    }

    // MARK: IBActions
    @IBAction func redSliderAction(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.2f", sender.value)
        redSenderValue = sender.value
        colorView.backgroundColor = UIColor(
            red: CGFloat(sender.value),
            green: CGFloat(greenSenderValue),
            blue: CGFloat(blueSenderValue),
            alpha: 1
        )
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenValueLabel.text = String(format: "%.2f", sender.value)
        greenSenderValue = sender.value
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSenderValue),
            green: CGFloat(sender.value),
            blue: CGFloat(blueSenderValue),
            alpha: 1
        )
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueValueLabel.text = String(format: "%.2f", sender.value)
        blueSenderValue = sender.value
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSenderValue),
            green: CGFloat(greenSenderValue),
            blue: CGFloat(sender.value),
            alpha: 1
        )
    }
}

