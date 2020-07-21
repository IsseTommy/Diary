//
//  AddViewController.swift
//  Diary
//
//  Created by Tommy on 2020/07/21.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {
    
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    var realm: Realm!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        realm = try! Realm()
    }
    
    @IBAction func save() {
        let diary = Diary()
        diary.date = dateTextField.text ?? "Undefined"
        diary.content = contentTextField.text ?? "Undefined"
        
        try! realm.write {
          realm.add(diary)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
