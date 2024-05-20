//
//  ViewController.swift
//  CoredataDemo
//
//  Created by Arpit Dhameliya on 2/27/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var txtNumber: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSave(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Fetch")
        
        DataBaseHalper.sherd.setData(name: self.txtName.text!, number: self.txtNumber.text!)
        self.txtName.text = ""
        self.txtNumber.text = ""
        
        self.navigationController?.pushViewController(vc, animated: true)

        
        print(FileManager.default.urls(for: .applicationSupportDirectory, in:.userDomainMask).first!)
        
                
        
    }
    
}

