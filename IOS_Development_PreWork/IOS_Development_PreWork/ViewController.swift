//
//  ViewController.swift
//  IOS_Development_PreWork
//
//  Created by Heston Vaughan on 8/22/23.
//

import UIKit

class Light {
    let view: UIView
    var prevColor: UIColor
    var lightOn = true
    
    init(view: UIView){
        self.view = view
        self.prevColor = self.view.backgroundColor ?? UIColor.white
    }
    
    func toggleLabelColor() {
        var labelColor: UIColor
        if lightOn {
            labelColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            labelColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.textColor = labelColor
            }
        }
    }
    
    func toggleLight() {
        if (lightOn) {
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            self.view.backgroundColor = self.prevColor
        }
        lightOn = !lightOn
        toggleLabelColor()
    }
}

class ViewController: UIViewController {

    var light: Light?
    override func viewDidLoad() {
        super.viewDidLoad()
        light = Light(view: view)
        // Do any additional setup after loading the view.
    }
    
    func getRandomColor() -> UIColor {
        let red = CGFloat.random(in:0...1)
        let green = CGFloat.random(in:0...1)
        let blue = CGFloat.random(in:0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 0.9)
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor = getRandomColor()
        light?.prevColor = randomColor
        if light?.lightOn == true {
            view.backgroundColor = randomColor
        }
    }
    
    @IBAction func toggleLight(_ sender: UISwitch) {
        light?.toggleLight()
    }
}

