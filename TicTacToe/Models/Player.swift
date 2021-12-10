//
//  Player.swift
//  TicTacToe
//
//  Created by Mattias Andersson on 2021-12-10.
//

import Foundation

class Player {
    var listOfCells: [Int] = []
    var playerType: Int = 0
    var playerName: String = ""
    
    
    init(listOfCells: [Int], playerType: Int, playerName: String) {
        self.listOfCells = listOfCells
        self.playerType = playerType
        self.playerName = playerName
    }
    
}
