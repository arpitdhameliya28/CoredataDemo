//
//  Fetch.swift
//  CoredataDemo
//
//  Created by Arpit Dhameliya on 3/1/24.
//

import UIKit

class Fetch: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [Savedata] = []
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        fetchDataFromCoreData()
        // Do any additional setup after loading the view.
    }
    
    func fetchDataFromCoreData() {
        // Call getData function from your DataBaseHalper class
        data = DataBaseHalper.sherd.getData()
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellFetch") as! TableViewCellFetch
        let item = data[indexPath.row]
        cell.txtName.text = item.name ?? ""
        cell.txtNumber.text = item.number ?? ""
        return cell
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        if data.first != nil {
            let indexToDelete = IndexPath(row: 0, section: 0)
            deleteData(at: indexToDelete)
        }
    }
    
    func deleteData(at indexPath: IndexPath) {
        let item = data[indexPath.row]
        let idToDelete = item.id
        DataBaseHalper.sherd.deletedata(id: Int(idToDelete))
        fetchDataFromCoreData()
    }
}
