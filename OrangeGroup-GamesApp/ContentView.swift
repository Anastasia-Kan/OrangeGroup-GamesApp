//
//  ContentView.swift
//  OrangeGroup-GamesApp
//
//  Created by Anastasia Kantor on 2020-11-24.
//

import SwiftUI

struct ContentView: View {
    
    var animals = ["Pojkearg", "Pojkeglad", "Pojkeledsen", "Pojkearg", "Pojkeglad", "Pojkeledsen"].shuffled()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationView{
            LazyVGrid(columns: layout, spacing: 1) {
                ForEach(0...5, id: \.self) {number in
                    
                    Image(self.animals[number]).resizable()
                        .frame(width: 150, height: 150)
                        .border(Color.black)
                    
                }
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
