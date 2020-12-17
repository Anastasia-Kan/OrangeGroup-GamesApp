//
//  MatchingCode.swift
//  OrangeGroup-GamesApp
//
//  Created by Anastasia Kantor on 2020-12-15.
//

import Foundation
import SwiftUI

class Card: NSObject, Identifiable {
    
    var id: String = ""
    var facename = ""
    var shown: Bool = false
    var isMatched: Bool = false
    
    //static var cards = [Card]()
    
    /*
    init(card: Card) {
        self.id = NSUUID().uuidString
        self.shown = false
    }
    */
    
    func equals(_ card: Card) -> Bool {
        return (card.id == id)
    }
}

class MemoryGame : NSObject, ObservableObject {
    @State var cards: [Card] = [Card]()
    var cardsShown: [Card] = [Card]()
    var isPlaying: Bool = false
    
    func setupGame(faces : [String])
    {
        for face in faces {
            var tempcard = Card()
            tempcard.id = UUID().uuidString
            tempcard.facename = face
            cards.append(tempcard)
        }
    }
    
    func shuffleCards(cards: [Card]) -> [Card] {
        var randomCards = cards
        randomCards.shuffle()
        
        return randomCards
    }
    
    func newGame(cardsArray: [Card]) -> [Card] {
        cards = shuffleCards(cards: cardsArray)
        isPlaying = true
        
        return cards
    }
    
    func restartGame() {
        isPlaying = false
        cards.removeAll()
        cardsShown.removeAll()
    }
    
    func unmatchedCardShown() -> Bool {
        return cardsShown.count % 2 != 0
    }
    
    func unmatchedCard() -> Card? {
        let unmatchedCard = cardsShown.last
        return unmatchedCard
    }
    
//    func didSelectCard(_card: Card?) {
//        guard let card = card else { return }
//        
//        if unmatchedCardShown(){
//            let unmatched = unmatchedCard()!
//            
//            if card equals(unmatched) {
//                cardsShown.append(card)
//            } else {
//                let secondCard = cardsShown.removeLast()
//            }
//        } else {
//            cardsShown.append(card)
//        }
//        
//        if cardsShown.count == cards.count  {
//            endGame()
//        }
//    }
}




