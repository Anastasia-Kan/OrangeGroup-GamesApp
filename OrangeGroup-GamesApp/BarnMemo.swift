//
//  CardSide.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-26.
//

import SwiftUI

struct CardSide: View {
    @Environment(\.presentationMode) var presentationMode
    
    var animals = ["Pojkeglad", "Pojkearg", "Pojkeledsen", "Pojkeglad", "Pojkearg", "Pojkeledsen"].shuffled()

 //   let frontImg = Image("Question_mark").resizable()
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.init(red: 238/255, green: 11/255, blue: 11/255, opacity: 1.0), Color.init(red: 122/255, green: 36/255, blue: 225/255, opacity: 1.0)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(0...5, id: \.self) {number in
                    let front = Image(systemName: "heart")
                        .resizable()
                        .foregroundColor(.init(red: 235/255, green: 166/255, blue: 166/255))
                        .background(Color.init(red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0))
                        
                        
                    let backImg = Image(animals[number])
                        .resizable()
                    FlipView(front: front, back: backImg)
                        .frame(width: 150, height: 150)
                        .cornerRadius(15)
                }
                    .shadow(color: .black, radius: 10, x: 5.0, y: 8.0)
                
            }.padding()
            Image(systemName: "arrowshape.turn.up.left.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .onTapGesture(perform: {
                    print("back to start")
                    presentationMode.wrappedValue.dismiss()
                })
                .shadow(color: .black, radius: 10, x: 5.0, y: 8.0)
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
}
