//
//  HomeViewController.swift
//  UIKitApp
//
//  Created by sergey on 09.01.2022.
//

import UIKit

class HomeViewController: UIViewController, colorViewControllerDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ViewController else { return  }
        destination.delegate = self
    }
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
