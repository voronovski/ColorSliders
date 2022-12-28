//
//  MainViewController.swift
//  ColorSliders
//
//  Created by Aleksei Voronovskii on 12/25/22.
//

import UIKit

class MainViewController: UIViewController {

    var color: UIColor!
    
    override func viewDidLoad() {
        color = view.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = color
    }

}
