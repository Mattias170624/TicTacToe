//
//  Game.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import Foundation

class Game {
    
    func performPlayerActions(cellTag: Int, myPlayer: Player, otherPlayer: Player) -> String {
        if !isCellTaken(cellTag: cellTag, combinedList: myPlayer.listOfCells + otherPlayer.listOfCells) {
            myPlayer.listOfCells.append(cellTag)
            
            if checkForWin(myPlayer: myPlayer) {
                return "player\(myPlayer.playerType)Won"
                
            } else if checkForNoWinners(combinedList: myPlayer.listOfCells + otherPlayer.listOfCells) {
                return "Draw"
            }
            return "SwitchTurn"
        }
        return ""
    }
    
    func isCellTaken(cellTag: Int, combinedList: [Int]) -> Bool {
        if combinedList.contains(cellTag) {
            return true
        } else {
            return false
        }
    }
    
    func checkForNoWinners(combinedList: [Int]) -> Bool {
        if combinedList.count == 9 {
            return true
        } else {
            return false
        }
    }
    
    func checkForWin(myPlayer: Player) -> Bool {
        let myListSet = Set(myPlayer.listOfCells)
        let winningArraySet: Set = [[1,2,3],
                                    [4,5,6],
                                    [7,8,9],
                                    [1,4,7],
                                    [2,5,8],
                                    [3,6,9],
                                    [1,5,9],
                                    [3,5,7]]
        
        for winningArray in winningArraySet {
            let winningSet = Set(winningArray)
            
            if winningSet.isSubset(of: myListSet) {
                return true
            }
        }
        return false
    }
    
}
