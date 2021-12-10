//
//  Game.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import Foundation

class Game {
    
    func isCellTaken(cellTag: Int, myList: Player, otherList: Player) -> Bool {
        if myList.listOfCells.contains(cellTag) || otherList.listOfCells.contains(cellTag) {
            return true
        } else {
            // If cell is not taken, just add it to myList
            myList.listOfCells.append(cellTag)
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
    
    func checkForWin(myList: Player) -> Bool {
        let myListSet = Set(myList.listOfCells)
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
