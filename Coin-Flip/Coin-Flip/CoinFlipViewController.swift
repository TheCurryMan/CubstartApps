//
//  CoinFlipViewController.swift
//  Coin-Flip
//
//  Created by Avinash Jain on 10/12/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

class CoinFlipViewController: UIViewController {
    @IBOutlet weak var coinImageView: UIImageView!
    
    @IBOutlet weak var flipResultLabel: UILabel!
    
    @IBOutlet weak var outcomeLabel: UILabel!
    var isHeads = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let randomNum = arc4random_uniform(2)
        if (randomNum % 2 == 0) {
            coinImageView.image = UIImage(named: "heads")
            outcomeLabel.text = "Result: Heads"
            if (isHeads) {
                flipResultLabel.text = "You were right!"
            } else {
                flipResultLabel.text = "You were wrong :("
            }
        } else {
            coinImageView.image = UIImage(named: "tails")
            outcomeLabel.text = "Result: Tails"
            if (!isHeads) {
                flipResultLabel.text = "You were right!"
            } else {
                flipResultLabel.text = "You were wrong :("
            }
        }
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
