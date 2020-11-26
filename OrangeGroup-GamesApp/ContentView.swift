//
//  ContentView.swift
//  OrangeGroup-GamesApp
//
//  Created by Anastasia Kantor on 2020-11-24.
//

import SwiftUI

struct ContentView: View {
    
    var animals = ["Dog-1", "Dog-2", "Kitten-1", "Kitten-2", "Lion-1", "Elefant-1"].shuffled()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView{
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(0...5, id: \.self) {number in
                    FlipView(
                        {
                            Image(self.animals[number]).resizable()
                                .frame(width: 150, height: 150)
                                .border(Color.black)
                        },
                        {
                            Rectangle
                                .frame(width: 150, height: 150)
                                .background(Color.red)
                        }
                    )
                    
                }
            }
        }
        .tabItem {
            Image(systemName: "hare.fill")
            Text("Spel")
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
