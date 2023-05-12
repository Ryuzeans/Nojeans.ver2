//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapView2: View {
    
    @State private var doubleTapActive: Bool = false
    @State private var tapcount: Int = 0
    @State private var handSize : CGFloat = 150
    @State private var flashAnimation: Bool = false
    let nextViewAction: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack() {
                    
                    Image("DoubleCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: doubleTapActive ? .infinity : 100 )
                        .frame(height: doubleTapActive ? geo.size.height : geo.size.height / 3)
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.4, blendDuration: 0.4)) {
                                doubleTapActive = true
                                tapcount += 1
                                print(tapcount)
                                if tapcount >= 2 {
                                    nextViewAction()
                                }
                            }
                        }
                        .padding(.horizontal,25)
                    
                    Image("TouchHand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: handSize)
                        .position(x:doubleTapActive ? 600 : 220,y: flashAnimation ? 550 : 500)
//                        .opacity(flashAnimation ? 1 : 0)
                        .onAppear{
                            withAnimation(.linear(duration: 0.8).repeatForever(autoreverses: true)){
                                                       flashAnimation.toggle()
                                                       // withAnimation:모든 glow에 적용 .linear: 일정한속도, duration: 0.5초동안 반짝거리기 . repeatforever(autoreverses:true)끝없이 반복
                                                       
                                                   }
                        }
                    
                    Text("가볍게 두 번\n눌러볼까요?")
                        .font(.customTitle())
                        .frame(maxWidth: .infinity)
                        .opacity(doubleTapActive ? 0 : 1)
                        .position(x: geo.size.width / 2 , y : doubleTapActive ? geo.size.height/2 : geo.size.height/8.3)

                    
                    Text("한 번 더\n해볼까요?")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.customTitle())
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .opacity(doubleTapActive ? 1 : 0)
                        .position(x: geo.size.width / 2 , y : doubleTapActive ? geo.size.height/2 : geo.size.height/4)
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.4, blendDuration: 0.4)) {
                                doubleTapActive = true
                                tapcount += 1
                                print(tapcount)
                                if tapcount >= 1 {
                                    nextViewAction()
                                }
                            }
                        }
                }
            }
        }
    }
    
}

struct DoubleTapView2_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView()
    }
}
