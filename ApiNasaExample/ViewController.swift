//
//  ViewController.swift
//  ApiNasaExample
//
//  Created by José Henrique Fernandes Silva on 28/08/20.
//  Copyright © 2020 José Henrique Fernandes Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picker: UIDatePicker!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Data maxima: data do dia atual
        let maxDate = Date()
        // Data minima: 28/06/1995
        var minDate = Date(timeIntervalSince1970: (31536000*25)+(172*86400))

        picker.maximumDate = maxDate
        picker.minimumDate = minDate
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage", case let nextVC = segue.destination as? ImageViewController {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            print(formatter.string(from: picker.date))
            nextVC?.dataString = formatter.string(from: picker.date)
            
        }
    }
    
    
    	
}
