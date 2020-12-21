//
//  GameController.swift
//  OrangeGroup-GamesApp
//
//  Created by Anastasia Kantor on 2020-12-18.
//

import SwiftUI

class GameController: ObservableObject {
    @Published var values: [String] = []      // array of all cards
    @Published var isCardFaceUp: [Bool] = []
    @Published var isCardGuessed: [Bool] = []
    var backSideImageName = "star"
    private var firstCardIndex = -1           // saving index of the first turned card (default value -1 surely out of range)
    var isItFirstCard: Bool {
        return firstCardIndex == -1
    }
    var isGameOver: Bool {                    // true if all pairs found
        let temp = isCardGuessed.reduce(0) { $0 + ($1 ? 1 : 0) }
        return temp == values.count

        
    }
    
    init(_ uniqueValueArray: [String], _ backSideImageName: String = "star") {
        values.append(contentsOf: uniqueValueArray)
        values.append(contentsOf: uniqueValueArray)
        values.shuffle()
        
        isCardFaceUp = Array(repeating: false, count: values.count)
        isCardGuessed = Array(repeating: false, count: values.count)
        
        self.backSideImageName = backSideImageName
    }
    
    func compareCards(id: Int) {
        if firstCardIndex == -1 {
            firstCardIndex = id
            return
        }
        if values[firstCardIndex] == values[id] {
            // pairs found
            isCardGuessed[firstCardIndex] = true
            isCardGuessed[id] = true
            //(EffectPlayer.shared.effectSound(effect: "FileNameForEffect")
            
            // TODO: sound effect/popping heart if pair found?
            
        } else {                                   // not paired
            // turn both cards back
            isCardFaceUp[firstCardIndex] = false
            isCardFaceUp[id] = false
        }
        firstCardIndex = -1
    }
    
    func reset() {
        values.shuffle()
        isCardFaceUp = Array(repeating: false, count: values.count)
        isCardGuessed = Array(repeating: false, count: values.count)
        firstCardIndex = -1
    }
}

