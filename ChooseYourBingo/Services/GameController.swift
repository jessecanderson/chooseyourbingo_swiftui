//
//  GameController.swift
//  ChooseYourBingo
//
//  Created by Jesse Anderson on 6/28/20.
//

import Foundation
import SwiftUI

class BingoGameManager {
    
    var allArrays: [Set<Int>] {
        
        let answerArray1: Set<Int> = [0, 1, 2, 3, 4]
        let answerArray2: Set<Int> = [5, 6, 7, 8, 9]
        let answerArray3: Set<Int> = [10, 11, 12, 13, 14]
        let answerArray4: Set<Int> = [15, 16, 17, 18, 19]
        let answerArray5: Set<Int> = [20, 21, 22, 23, 24]
        let answerArray6: Set<Int> = [0, 5, 10, 15, 20]
        let answerArray7: Set<Int> = [1, 6, 11, 16, 21]
        let answerArray8: Set<Int> = [2, 7, 12, 17, 22]
        let answerArray9: Set<Int> = [3, 8, 13, 18, 23]
        let answerArray10: Set<Int> = [4, 9, 14, 19, 24]
        let answerArray11: Set<Int> = [0, 6, 12, 18, 24]
        let answerArray12: Set<Int> = [4, 8, 12, 16, 20]
        
        let allArrays = [answerArray1,
                         answerArray2,
                         answerArray3,
                         answerArray4,
                         answerArray5,
                         answerArray6,
                         answerArray7,
                         answerArray8,
                         answerArray9,
                         answerArray10,
                         answerArray11,
                         answerArray12]
        
        return allArrays
        
    }
    
    func createGameBoard(from board: [BingoButton]) -> [BingoButton] {
        var shuffled = board.shuffled()
        if shuffled.count > 24 {
            let numToRemove = shuffled.count - 24
            shuffled.removeLast(numToRemove)
        }
        var freeSpace = BingoButton(title: "Free Space")
        freeSpace.isTapped = true
        freeSpace.backgroundColor = .white
        freeSpace.cellNumber = 12
        shuffled.insert(freeSpace, at: 12)
        return shuffled
    }
    
    func checkingForAnswers(from userAnswerArray: [Int]) -> Bool {
        var filteredArray: Set<Int> = []
        
        for array in allArrays {
            filteredArray = Set(userAnswerArray).intersection(Set(array))
            if filteredArray == array {
                // print(checkedArray)
                return true
            } else {
                filteredArray = []
            }
        }
        return false
    }
    
}
