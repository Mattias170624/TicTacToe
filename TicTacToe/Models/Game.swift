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
    
    func checkForWinOrLose(myList: [Int], name: String) {
        let myListSet = Set(myList)
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
                print("WIN!!")
                prepareForEndScreen(bothLost: false, whatPlayerWon: name)
                return
            }
        }
        
        if myList.count >= 5 {
            print("No Winners!")
            prepareForEndScreen(bothLost: true, whatPlayerWon: name)
            return
        }
    }
    
    func prepareForEndScreen(bothLost: Bool, whatPlayerWon: String) {
        if bothLost {
        } else {
            print("player: \(whatPlayerWon) won!")
        }
    }
    
}
