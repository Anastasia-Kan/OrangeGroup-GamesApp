//
//  HomeView.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-30.
//

import SwiftUI

struct HomeView: View {
    
    @State var goChildMemo = false
    @State var goMomMemo = false
    @State var goDadMemo = false
    
    var body: some View {
        
        ZStack {
                    
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

        VStack {
            VStack {
                Image("Pojkeglad")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Barn Memo")
                    
            }
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onTapGesture(perform: {
                goChildMemo = true
                print("Tryckt på barnmemo")
            })
            .fullScreenCover(isPresented: $goChildMemo, content: {
                        CardSide()
                        
                    })
            
            .padding()
            .background(Color.white)
            .cornerRadius(15)
          
            
            VStack {
                Image("Pappaglad")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Pappa Memo")
            }
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onTapGesture(perform: {
                goDadMemo = true
                print("Tryckt på pappamemo")
            })
            .fullScreenCover(isPresented: $goDadMemo, content: {
                        PappaMemo()
                    })
            
            .padding()
            .background(Color.white)
            .cornerRadius(15)
                
            VStack {
                Image("Mammaglad")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Mamma Memo")
                }

            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onTapGesture(perform: {
                goMomMemo = true
                print("Tryckt på mammamemo")
            })
            
            .fullScreenCover(isPresented: $goMomMemo, content: {
                        MammaMemo()
                           
            })
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            
        }.onAppear() {
            goChildMemo = false
            goDadMemo = false
            goMomMemo = false
        }
        
            
    }
        
}
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
