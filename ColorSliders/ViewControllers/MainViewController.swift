//
//  MainViewController.swift
//  ColorSliders
//
//  Created by Aleksei Voronovskii on 12/25/22.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(for color: UIColor)
}

final class MainViewController: UIViewController {

    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        color = view.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = color
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(for color: UIColor) {
        self.color = color
        view.backgroundColor = color
    }
}
