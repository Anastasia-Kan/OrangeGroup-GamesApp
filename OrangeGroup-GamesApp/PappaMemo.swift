//
//  PappaMemo.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-30.
//

import SwiftUI

struct PappaMemo: View {
    @Environment(\.presentationMode) var presentationMode
    
    var animalsPappaView = ["Pappaarg", "Pappaglad", "Pappaledsen", "Pappaarg", "Pappaglad", "Pappaledsen"].shuffled()

 //   let frontImgPappaView = Image("Question_mark").resizable()
    let layoutPappaView = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: layoutPappaView, spacing: 20) {
                ForEach(0...5, id: \.self) {number in
                    let front = Image("")
                        .resizable()
                        .background(LinearGradient(gradient: .init(colors: [.red, .purple]), startPoint: .bottom, endPoint: .top))
                       
                        
                        
                    let backImg = Image(animalsPappaView[number])
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

func sizePappaViewÅÄå() -> CGFloat {
    return UIScreen.main.bounds.width/3
}

struct PappaMemo_Previews: PreviewProvider {
    static var previews: some View {
        PappaMemo()
    }
}
