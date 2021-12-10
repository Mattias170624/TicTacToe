//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import UIKit

class GameViewController: UIViewController {
    
    var player1Type: Int!
    var player2Type: Int!
    var player1: Player!
    var player2: Player!
    var startingPlayer: Int!
    
    @IBOutlet weak var player1Field: UILabel!
    @IBOutlet weak var player2Field: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player2Field.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 1)
        player1 = Player(listOfCells: [], playerType: player1Type, playerName: "Player 1")
        player2 = Player(listOfCells: [], playerType: player2Type, playerName: "Player 2")
        
        assignButtonTags()
        displayPlayerTurn(player: (1...2).randomElement()! )
        
    }
    
    func assignButtonTags() {
        // Assigns each button a tag to identify them later on
        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        button4.tag = 4
        button5.tag = 5
        button6.tag = 6
        button7.tag = 7
        button8.tag = 8
        button9.tag = 9
        
    }
    
    func displayPlayerTurn(player: Int) {
        switch player {
        case 1:
            player1Field.backgroundColor = .lightGray
            player2Field.backgroundColor = .green
            startingPlayer = 2
        case 2:
            player1Field.backgroundColor = .green
            player2Field.backgroundColor = .lightGray
            startingPlayer = 1
        default:
            break
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch startingPlayer {
        case 1:
            if !Game().isCellTaken(cellTag: sender.tag, myList: player1, otherList: player2) {
                sender.setTitle("X", for: [])
                
                // Check for win, if not just switch players turn
                Game().checkForWinOrLose(myList: player1.listOfCells, name: player1.playerName)
                displayPlayerTurn(player: 1)
            }
            
        case 2:
            if !Game().isCellTaken(cellTag: sender.tag, myList: player2, otherList: player1) {
                sender.setTitle("O", for: [])
                
                // Check for win, if not just switch players turn
                Game().checkForWinOrLose(myList: player2.listOfCells, name: player2.playerName)
                displayPlayerTurn(player: 2)
            }
            
        default:
            break
        }
        
        print("Player 1: \(player1.listOfCells)")
        print("Player 2: \(player2.listOfCells) \n")
        
    }
    
}
