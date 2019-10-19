//
//  ViewController.swift
//  CubstartAPITest
//
//  Created by Avinash Jain on 10/18/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

struct listItem: Decodable {
    let items: [String]
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var todoList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "item")
        
        getAPIData()
    }
    
    
    func addData(item: String) {
        let url = "https://6ddd9ad8.ngrok.io/add?item=" + item
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            }.resume()
    }
    
    func getAPIData() {
        // Fill this in!
        let url = "https://6ddd9ad8.ngrok.io/get"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            do {
                let jsonData = try JSONDecoder().decode(listItem.self, from: data!)
                self.todoList = jsonData.items
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "item") as! ItemTableViewCell
        cell.itemName.text = todoList[indexPath.row]
        return cell
    }
    
    @IBAction func reloadTable(_ sender: Any) {
        self.addData(item: "Conditioner")
        getAPIData()
    }
}

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    
}

