//
//  CardSide.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-26.
//

import SwiftUI

var animals = ["Dog-1", "Dog-2", "Kitten-1", "Kitten-2", "Lion-1", "Elefant-1"].shuffled()

let frontImg = Image("Question_mark").resizable()
let layout = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct CardSide: View {
    var body: some View {

        NavigationView{
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(0...5, id: \.self) {number in
                    let front = Image("")
                        .resizable()
                        .background(Color.green)
                        
                        
                    let backImg = Image(animals[number])
                        .resizable()
                    FlipView(front: front, back: backImg)
                        .frame(width: size(), height: size())
                        .border(Color.black)
                }
            }
        }
    }
}

func size() -> CGFloat {
    return UIScreen.main.bounds.width/3
}

struct CardSide_Previews: PreviewProvider {
    static var previews: some View {
        CardSide()
    }
}
