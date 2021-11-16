//
//  ViewController.swift
//  UIKitApp
//
//  Created by sergey on 09.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redNumberLabel: UILabel!
    @IBOutlet weak var greenNumberLabel: UILabel!
    @IBOutlet weak var blueNumberLabel: UILabel!
    
    class ColorViewClass {
        var red = 0
        var green = 0
        var blue = 0
        
        func reColorView(view: UIView){
            view.backgroundColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
        }
    }
    var colorViewClass = ColorViewClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func redActionSlider(_ sender: UISlider) {
        let senderValue = Int(sender.value)
        colorViewClass.red = senderValue
        redNumberLabel.text = String(senderValue)
        colorViewClass.reColorView(view: colorView)
    }
    
    @IBAction func greenActionSlider(_ sender: UISlider) {
        let senderValue = Int(sender.value)
        colorViewClass.green = senderValue
        greenNumberLabel.text = String(senderValue)
        colorViewClass.reColorView(view: colorView)
    }
    
    @IBAction func blueActionSlider(_ sender: UISlider) {
        let senderValue = Int(sender.value)
        colorViewClass.blue = senderValue
        blueNumberLabel.text = String(senderValue)
        colorViewClass.reColorView(view: colorView)
    }
}

