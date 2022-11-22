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
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
    }

    // MARK: IBActions
    @IBAction func redSliderAction(_ sender: UISlider) {
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
    }
}

