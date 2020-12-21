//
//  HomeView.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-30.
//

import SwiftUI

struct HomeView: View {
    @State var goToMamma = false
    @State var goToPappa = false
    @State var goToPojke = false
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.init(red: 238/255, green: 11/255, blue: 11/255, opacity: 1.0), Color.init(red: 122/255, green: 36/255, blue: 225/255, opacity: 1.0)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {    // Button Pojke
                    Image("Pojkeglad")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                   
                }
                .frame(width: 150, height: 150, alignment: .center)
                .onTapGesture(perform: {
                    goToPojke = true
                }).modifier(ButtonModifier())
                
                VStack {    // Button Pappa
                    Image("Pappaglad")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                }
                .frame(width: 150, height: 150, alignment: .center)
                .onTapGesture(perform: {
                    goToPappa = true
                }).modifier(ButtonModifier())
                
                VStack {    // Button Mamma
                    Image("Mammaglad")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                   
                }
                .frame(width: 150, height: 150, alignment: .center)
                .onTapGesture(perform: {
                    goToMamma = true
                }).modifier(ButtonModifier())
                
            }
            Group {
                EmptyView().fullScreenCover(isPresented: $goToMamma) {
                    GameView(game: GameController(["Mammaglad", "Mammaarg", "Mammaledsen"], "sun.max"))
                }
                EmptyView().fullScreenCover(isPresented: $goToPappa) {
                    GameView(game: GameController(["Pappaarg", "Pappaglad", "Pappaledsen"], "star"))
                }
                EmptyView().fullScreenCover(isPresented: $goToPojke) {
                    GameView(game: GameController(["Pojkeglad", "Pojkearg", "Pojkeledsen"], "heart.fill"))
                }
            } .shadow(color: .black, radius: 10, x: 5.0, y: 8.0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .background(Color.white)
            .cornerRadius(15)
    }
}
