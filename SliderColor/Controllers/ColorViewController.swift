//
//  MainViewController.swift
//  SliderColor
//
//  Created by Nicholas Smith on 10/14/22.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(withred red: CGFloat, green: CGFloat, andblue blue: CGFloat)
}

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.anotherColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension ColorViewController: SettingsViewControllerDelegate {
    func setColor(withred red: CGFloat, green: CGFloat, andblue blue: CGFloat) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
    }
}
