//
//  EmojiViewController.swift
//  EmojiDictionary
//
//  Created by Avinash Jain on 10/12/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    var selectedEmoji = ""
    let emojiDefinitions = ["😤":"SMH", "😎":"Hell Yeah", "🍎":"Apple", "😭":"Crying"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emojiLabel.text = selectedEmoji
        definitionLabel.text = emojiDefinitions[self.selectedEmoji]
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
