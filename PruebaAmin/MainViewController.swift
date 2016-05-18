//
//  MainViewController.swift
//  PruebaAmin
//
//  Created by Abraham Hurtado on 18/05/16.
//  Copyright © 2016 CSIPRO. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var botonObtenerCalificacion: UILabel!
    
    @IBOutlet weak var calificacionLabel: UILabel!
    
    var nombreBulbasaur: String = ""
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        calificacionLabel.text = "Hola Amín"
        getPokemon()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hola")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI (pokemon: NSDictionary) {
        calificacionLabel.text = "Hola, \(pokemon["name"] as! String)"
    }
    
    func getPokemon () {
    
        let endpoint: String = "http://pokeapi.co/api/v2/pokemon/1"
        
        let session = NSURLSession.sharedSession()
        
        let url = NSURL(string: endpoint)!
        
        session.dataTaskWithURL(url) { (data: NSData?, response:NSURLResponse?, error: NSError?) in
            if error == nil {
                do {
                    if var _ = NSString(data: data!, encoding: NSUTF8StringEncoding) {
                        let datos = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                        
                        self.nombreBulbasaur = datos["name"] as! String
                        

                        self.performSelectorOnMainThread(#selector(MainViewController.updateUI(_:)), withObject: datos, waitUntilDone: true)
                        
                        
                    }
                } catch {
                    print("Te la kreiste men")
                }
            }
        }.resume()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! ViewController
        
        print(nombreBulbasaur)
        
        viewController.nombreBulbasaur = nombreBulbasaur
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
