//
//  ViewController.swift
//  SliderColor
//
//  Created by Nicholas Smith on 9/28/22.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var viewOutlet: UIView!
    
    @IBOutlet var redAmount: UILabel!
    @IBOutlet var greenAmount: UILabel!
    @IBOutlet var blueAmount: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var anotherColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ciColor = CIColor(color: anotherColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
        
        redAmount.text = String(format: "%.2f", redSlider.value)
        greenAmount.text = String(format: "%.2f", greenSlider.value)
        blueAmount.text = String(format: "%.2f", blueSlider.value)
        
        viewOutlet.layer.cornerRadius = 10
        viewOutlet.backgroundColor = anotherColor
    }

    //MARK: - IBActions
    @IBAction func redSliderPressed() {
        redAmount.text = String(format: "%.2f", redSlider.value)
        changeColor()
    }
    
    @IBAction func greenSliderPressed() {
        greenAmount.text = String(format: "%.2f", greenSlider.value)
        changeColor()
    }
    
    @IBAction func blueSliderPressed() {
        blueAmount.text = String(format: "%.2f", blueSlider.value)
        changeColor()
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
        delegate.setColor(withred: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), andblue: CGFloat(blueSlider.value))
    }
    
    func changeColor() {
        viewOutlet.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
