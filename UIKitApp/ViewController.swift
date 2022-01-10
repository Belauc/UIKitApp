//
//  ViewController.swift
//  UIKitApp
//
//  Created by sergey on 09.11.2021.
//

import UIKit


protocol colorViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redNumberLabel: UILabel!
    @IBOutlet weak var greenNumberLabel: UILabel!
    @IBOutlet weak var blueNumberLabel: UILabel!
    
    @IBOutlet weak var redSliderOutleet: UISlider!
    @IBOutlet weak var blueSliderOutleet: UISlider!
    @IBOutlet weak var greenSliderOutleet: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    var delegate: colorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 10
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        redTF.keyboardType = .numberPad
        greenTF.keyboardType = .numberPad
        blueTF.keyboardType = .numberPad
    }

    @IBAction func ActionSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            setValueLabels(labels: redNumberLabel)
        case 1:
            setValueLabels(labels: greenNumberLabel)
        case 2:
            setValueLabels(labels: blueNumberLabel)
        default:
            print("default")
        
        }
        changeColorView()

    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate?.setColor(colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
}

extension ViewController{
    
    private func setValueLabels(labels: UILabel...){
        labels.forEach({ label in
            switch label.tag{
            case 0:
                label.text = String(Int(redSliderOutleet.value))
            case 1:
                label.text = String(Int(greenSliderOutleet.value))
            case 2:
                label.text = String(Int(blueSliderOutleet.value))
            default:
                break
            }
        })
    }
    private func changeColorView(){
        colorView.backgroundColor = UIColor(red:CGFloat(redSliderOutleet.value)/255,
                                            green: CGFloat(greenSliderOutleet.value)/255,
                                            blue: CGFloat(blueSliderOutleet.value)/255,
                                            alpha: 1)
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Int(text), currentValue <= 255, currentValue >= 0 {
            switch textField.tag {
            case 0:
                redSliderOutleet.value = Float(currentValue)
                setValueLabels(labels: redNumberLabel)
            case 1:
                greenSliderOutleet.value = Float(currentValue)
                setValueLabels(labels: greenNumberLabel)
            case 2:
                blueSliderOutleet.value = Float(currentValue)
                setValueLabels(labels: blueNumberLabel)
            default:
                print("default")
            }
            
        }
        changeColorView()
    }
}
