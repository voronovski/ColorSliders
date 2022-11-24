//
//  ViewController.swift
//  ColorSliders
//
//  Created by Aleksei Voronovskii on 11/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    // не смог победить дергающиеся слайдеры. так и не понял, как настроить констрейнты
    
    var redSenderValue: Float = 0.5
    var greenSenderValue: Float = 0.5
    var blueSenderValue: Float = 0.5
    
    // MARK: IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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

