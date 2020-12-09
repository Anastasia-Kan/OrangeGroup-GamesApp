//
//  CardSide.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-26.
//

import SwiftUI

struct CardSide: View {
    @Environment(\.presentationMode) var presentationMode
    
    var animals = ["mammaglad", "Mammaarg", "Mammaledsen", "Mammaglad", "mammaarg", "Mammaledsen"].shuffled()

 //   let frontImg = Image("Question_mark").resizable()
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(0...5, id: \.self) {number in
                    let front = Image("")
                        .resizable()
                        .background(LinearGradient(gradient: .init(colors: [.red, .purple]), startPoint: .bottom, endPoint: .top))
                        
                        
                    let backImg = Image(animals[number])
                        .resizable()
                    FlipView(front: front, back: backImg)
                        .frame(width: size(), height: size())
                        .border(Color.black)
                }
            }.padding()
            Image(systemName: "arrowshape.turn.up.left.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
                .onTapGesture(perform: {
                    print("back to start")
                    presentationMode.wrappedValue.dismiss()
                })
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
