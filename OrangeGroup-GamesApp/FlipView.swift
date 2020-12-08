//
//  FlipView.swift
//  OrangeGroup-GamesApp
//
//  Created by Lina Li on 2020-11-26.
//

import SwiftUI

struct FlipView<Front: View, Back: View> : View {
    let front: Front
    let back: Back
    
    init(front: Front, back: Back) {
       self.front = front
       self.back = back
    }

    var body: some View {
        GeometryReader{
            FlipContent(front: self.front, back: self.back, size: $0.size)
        }
  //      .frame(height: 120.0)
    }
}

private struct FlipContent<Front: View, Back: View>: View{
    let front: Front
    let back: Back
    let size: CGSize
    
    @State var angleState = TranslatingAngleState()
    
    var body: some View {
        ZStack(alignment: .center) {
            front
                .opacity(angleState.showingFront ? 1.0 : 0.0)
            back
                .scaleEffect(CGSize(width: -1.0, height: 1.0))
                .opacity(angleState.showingFront ? 0.0 : 1.0)
        }
        .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .center)
        .rotation3DEffect(
            .degrees(angleState.total),
            axis: (x: 0.0, y: 1.0, z: 0.0),perspective: 0.5)
        .onTapGesture {
            var currentState = self.angleState
            currentState.angle -= 180.0
            currentState.angleTranslation = 0.0
            withAnimation{
                self.angleState = currentState
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0.0, coordinateSpace: .local)
                .onChanged { value in
                    let angle = Double((value.translation.width / self.size.width)) * 180.0
                    self.angleState.angleTranslation = angle
                }
                .onEnded {value in
                    let endAngle = Double((value.translation.width / self.size.width)) * 180.0
                    let animation = self.$angleState.animation(.spring())
                    
                    var currentState = self.angleState
                    if endAngle >= 90.0 {
                        currentState.angle += 180.0
                    } else if endAngle < -90.0{
                        currentState.angle -= 180.0
                    }
                    
                    currentState.angleTranslation = 0.0
                    animation.wrappedValue = currentState
                })
    }
}


struct TranslatingAngleState{
    var angle: Double = 0.0
    var angleTranslation: Double = 0.0
    
    var total: Double{
        angle + angleTranslation
    }
    
    var clamped: Double{
        var clampedAngle = angleTranslation + angle
        while clampedAngle < 360.0 {
            clampedAngle += 360
        }
        return clampedAngle.truncatingRemainder(dividingBy: 360.0)
    }
    
    var showingFront: Bool {
        let clampedAngle = clamped
        return clampedAngle < 90.0 || clampedAngle > 270.0
        
    }
    
}


