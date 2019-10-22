//
//  ViewController.swift
//  CubstartAPITest
//
//  Created by Avinash Jain on 10/18/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var countryList:[Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "item")
        
        getAPIData()
    }
    
    
    func addData(item: String) {
        let url = "http://restcountries.eu/rest/v2/all" + item
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            }.resume()
    }
    
    func getAPIData() {
        // Fill this in!
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            do {
                let jsonData = try JSONDecoder().decode([Country].self, from: data!)
                self.countryList = jsonData
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "item") as! ItemTableViewCell
        cell.itemName.text = countryList[indexPath.row].name
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

