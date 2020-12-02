//
//  MammaMemo.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-30.
//

import SwiftUI

var animalsMammaView = ["Dog-1", "Dog-2", "Kitten-1", "Kitten-2", "Lion-1", "Elefant-1"].shuffled()

let frontImgMammaView = Image("Question_mark").resizable()
let layoutMammaiew = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct MammaMemo: View {
    var body: some View {
        NavigationView{
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
            }
        }
        .navigationBarTitle("Mamma Memo")
    }
}

func sizeMammaView() -> CGFloat {
    return UIScreen.main.bounds.width/3
}

struct MammaMemo_Previews: PreviewProvider {
    static var previews: some View {
        MammaMemo()
    }
}
