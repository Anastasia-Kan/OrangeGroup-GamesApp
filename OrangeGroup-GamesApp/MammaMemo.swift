//
//  MammaMemo.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-30.
//

import SwiftUI

struct MammaMemo: View {
    @Environment(\.presentationMode) var presentationMode
    
    var animalsMammaView = ["Mammaglad", "Mammaarg", "Mammaledsen", "Mammaglad", "Mammaarg", "Mammaledsen"].shuffled()

 //   let frontImgMammaView = Image("Question_mark").resizable()
    let layoutMammaiew = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.init(red: 238/255, green: 11/255, blue: 11/255, opacity: 1.0), Color.init(red: 122/255, green: 36/255, blue: 225/255, opacity: 1.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            LazyVGrid(columns: layoutMammaiew, spacing: 20) {
                ForEach(0...5, id: \.self) {number in
                    let front = Image("")
                        .resizable()
                        .background(Color.init(red: 122/255, green: 36/255, blue: 225/255, opacity: 1.0))
                        
                       
                        
                        
                    let backImg = Image(animalsMammaView[number])
                        .resizable()
                    FlipView(front: front, back: backImg)
                        .frame(width: size(), height: size())
                        .border(Color.black)
                }
            }.padding()
            Image(systemName: "arrowshape.turn.up.left.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .onTapGesture(perform: {
                    print("back to start")
                    presentationMode.wrappedValue.dismiss()
                })
        }
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
}
