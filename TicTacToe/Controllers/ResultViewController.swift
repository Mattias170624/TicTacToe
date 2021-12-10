//
//  ResultViewController.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var whoWonLabel: UILabel!
    var whatPlayerWon: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayWhoWon(winningPlayer: whatPlayerWon)
        
    }
    
    func displayWhoWon(winningPlayer: Int) {
        switch winningPlayer {
        case 0:
            whoWonLabel.text = "Draw!"
        case 1:
            whoWonLabel.text = "Player X won!"
        case 2:
            whoWonLabel.text = "Player O won!"
        default:
            break
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToStart", sender: self)
    }
    
}
