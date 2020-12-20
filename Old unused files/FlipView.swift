////
////  FlipView.swift
////  OrangeGroup-GamesApp
////
////  Created by Lina Li on 2020-11-26.
////
//
//import SwiftUI
//
//struct FlipView<Front: View, Back: View> : View {
//    let front: Front
//    let back: Back
//    let sound: String
//    
//    var flipDone = {}
//    
//    
//    init(front: Front, back: Back, sound: String) {
//        self.front = front
//        self.back = back
//        self.sound = sound
//    }
//
//    var body: some View {
//        GeometryReader{
//            FlipContent(front: self.front, back: self.back, size: $0.size, sound: sound, flipDone: flipDone)
//        }
//    }
//}
//
//private struct FlipContent<Front: View, Back: View>: View{
//    let front: Front
//    let back: Back
//    let size: CGSize
//    let sound: String
//    
//    @State var angleState = TranslatingAngleState()
//    
//    @State var isFlipped = false
//    
//    var flipDone = {}
//    
//    
//    var body: some View {
//        ZStack(alignment: .center) {
//            front
//                .opacity(angleState.showingFront ? 1.0 : 0.0)
//            back
//                .scaleEffect(CGSize(width: -1.0, height: 1.0))
//                .opacity(angleState.showingFront ? 0.0 : 1.0)
//        }
//        .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .center)
//        .rotation3DEffect(
//            .degrees(angleState.total),
//            axis: (x: 0.0, y: 1.0, z: 0.0),perspective: 0.5)
//        .onTapGesture {
//            if(isFlipped == false)
//            {
//                isFlipped = true
//                var currentState = self.angleState
//                currentState.angle -= 180.0
//                currentState.angleTranslation = 0.0
//                withAnimation{
//                    self.angleState = currentState
//                }
//                if !angleState.showingFront {
//                    EffectPlayer.shared.effectSound(effect: sound)}
//                
//                flipDone()
//            }
//            
//        }
//    }
//}
//
//
//struct TranslatingAngleState{
//    var angle: Double = 0.0
//    var angleTranslation: Double = 0.0
//    
//    var total: Double{
//        angle + angleTranslation
//    }
//    
//    var clamped: Double{
//        var clampedAngle = angleTranslation + angle
//        while clampedAngle < 360.0 {
//            clampedAngle += 360
//        }
//        return clampedAngle.truncatingRemainder(dividingBy: 360.0)
//    }
//    
//    var showingFront: Bool {
//        let clampedAngle = clamped
//        return clampedAngle < 90.0 || clampedAngle > 270.0
//        
//    }
//    
//}
//
//