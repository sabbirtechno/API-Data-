//
//  ViewController.swift
//  ApiGet
//
//  Created by Sabbir Hossain on 1/13/20.
//  Copyright © 2020 Sabbir Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtview: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btn(_ sender: Any) {
        
        guard let url = URL(string: "https://api.darksky.net/forecast/5c74c06e261c64b3a2f6e1abfb7fe85d/37.8267,-122.4233") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    self.txtview.text = String(bytes: data, encoding: .utf8)
                } catch {
                    print(error)
                }
                
            }
            }.resume()

        
    }
    
    
    
}

