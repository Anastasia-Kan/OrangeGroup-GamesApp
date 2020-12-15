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
    var artworkURL: UIImage!
    
    static var allCards = [Card]()
    
    init(card: Card) {
        self.id = card.id
        self.shown = card.shown
        self.artworkURL = card.artworkURL
    }
    
    init (image: UIImage) {
    self.id = NSUUID().uuidString
    self.shown = false
    self.artworkURL = image
    }
    
    func equals(_ card: Card) -> Bool {
        return (card.id == id)
    }
    
}
