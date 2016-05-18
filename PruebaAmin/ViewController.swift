//
//  ViewController.swift
//  PruebaAmin
//
//  Created by Abraham Hurtado on 18/05/16.
//  Copyright © 2016 CSIPRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var nombreBulbasaur : String = ""
    @IBOutlet weak var bulbasaurLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Bulbasaur"
        bulbasaurLabel.text = nombreBulbasaur
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

