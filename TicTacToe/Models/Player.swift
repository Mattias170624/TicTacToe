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
    
    init(listOfCells: [Int], playerType: Int) {
        self.listOfCells = listOfCells
        self.playerType = playerType
    }
    
}
