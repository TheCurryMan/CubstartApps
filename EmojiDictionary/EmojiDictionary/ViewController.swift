//
//  ViewController.swift
//  EmojiDictionary
//
//  Created by Avinash Jain on 10/12/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let emojis = ["😤", "😎", "🍎", "😭", "😂", "😇", "🥵", "👿", "🥭", "🥑"]
    var indexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "emoji", for: indexPath)
        cell.textLabel?.text = emojis[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPath = indexPath.row
        performSegue(withIdentifier: "emoji", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc: EmojiViewController = segue.destination as! EmojiViewController
        vc.selectedEmoji = emojis[indexPath]
    }


}

