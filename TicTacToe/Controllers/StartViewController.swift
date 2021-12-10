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
    
    var playerType: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentValue(_ sender: Any) {
        switch opponentSegment.selectedSegmentIndex {
        case 0:
            playerType = 1
        case 1:
            playerType = 2
        default:
            break
        }
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
    }
}

