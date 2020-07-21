//
//  ViewController.swift
//  Diary
//
//  Created by Tommy on 2020/07/21.
//  Copyright © 2020 Tommy. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    var realm: Realm!
    
    var diaries: Results<Diary>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // TableViewの初期化
        table.delegate = self
        table.dataSource = self
        
        // Realmの初期化
        realm = try! Realm()
        
        diaries = realm.objects(Diary.self)
        table.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        diaries = realm.objects(Diary.self)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = diaries[indexPath.row].content + " - " +  diaries[indexPath.row].date
        return cell
    }
}
