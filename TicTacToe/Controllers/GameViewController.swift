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
    var whatPlayerWon: Int!
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
        
        // Random player starts
        displayPlayerTurn(player: (1...2).randomElement()! )
        
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
    
    func goToWinningScreen(winningPlayer: Int, bothLost: Bool) {
        if bothLost == true {
            whatPlayerWon = 0
        } else {
            whatPlayerWon = winningPlayer
        }
        
        self.performSegue(withIdentifier: "segueToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResult" {
            let destination = segue.destination as! ResultViewController
            
            destination.whatPlayerWon = whatPlayerWon
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch startingPlayer {
        case 1:
            if !Game().isCellTaken(cellTag: sender.tag, myList: player1, otherList: player2) {
                sender.setTitle("X", for: [])
                
                // Check for win, if not just switch players turn
                if Game().checkForWin(myList: player1) {
                    goToWinningScreen(winningPlayer: 1, bothLost: false)
                } else {
                    if Game().checkForNoWinners(combinedList: player1.listOfCells + player2.listOfCells) {
                        goToWinningScreen(winningPlayer: 0, bothLost: true)
                    } else {
                        displayPlayerTurn(player: 1)
                    }
                }
            }
            
        case 2:
            if !Game().isCellTaken(cellTag: sender.tag, myList: player2, otherList: player1) {
                sender.setTitle("O", for: [])
                
                // Check for win, if not just switch players turn
                if Game().checkForWin(myList: player2) {
                    goToWinningScreen(winningPlayer: 2, bothLost: false)
                } else {
                    if Game().checkForNoWinners(combinedList: player1.listOfCells + player2.listOfCells) {
                        goToWinningScreen(winningPlayer: 0, bothLost: true)
                    } else {
                        displayPlayerTurn(player: 2)
                    }
                }
            }
            
        default:
            break
        }
    }
    
}
