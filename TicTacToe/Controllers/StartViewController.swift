//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var opponentLabel: UILabel!
    @IBOutlet weak var opponentSegment: UISegmentedControl!
    @IBOutlet weak var startButton: UIButton!
    
    var player1Type: Int! = 1
    var player2Type: Int! = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func segmentValue(_ sender: Any) {
        switch opponentSegment.selectedSegmentIndex {
        case 0:
            player1Type = 1
            player2Type = 2
        case 1:
            player1Type = 1
            player2Type = 3
        default:
            break
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToGame" {
            let destination = segue.destination as! GameViewController
            
            destination.player1Type = player1Type!
            destination.player2Type = player2Type!
        }
    }
}

