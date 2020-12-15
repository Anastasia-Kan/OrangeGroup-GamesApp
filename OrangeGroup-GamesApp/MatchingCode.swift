//
//  MatchingCode.swift
//  OrangeGroup-GamesApp
//
//  Created by Anastasia Kantor on 2020-12-15.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    
    var id: String
    var shown: Bool = false
    var isMatched: Bool = false
    
    static var allCards = [Card]()
    
    init(card: Card) {
        self.id = card.id
        self.shown = card.shown
    }

    func equals(_ card: Card) -> Bool {
        return (card.id == id)
    }
    
}

