//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapView2: View {
    
    @State private var doubleTapActive: Bool = false
    @State private var opactyTapActive: Bool = false
    @State private var oneMoreTapActive: Bool = false
    @State private var tapcount: Int = 0
    @State private var handSize : CGFloat = 150
    @State private var flashAnimation: Bool = false
    let nextViewAction: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack() {
                    
                    Image("ToucherCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: doubleTapActive || oneMoreTapActive ? .infinity : 100 )
                        .frame(height: doubleTapActive ? geo.size.height : geo.size.height / 3)
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.6, blendDuration: 0.6)) {
                                opactyTapActive = true
                                doubleTapActive.toggle()
                                tapcount += 1
                                
                                print(tapcount)
                                if tapcount >= 2 {
                                    oneMoreTapActive.toggle()
                                    
                                    
                                    //                                    nextViewAction()
                                }
                                print("dt : \(doubleTapActive)")
                                print("ot : \(oneMoreTapActive)")
                            }
                        }
                        .padding(.horizontal,25)
                    
                    Image(systemName:"hand.point.up.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: handSize)
                        .opacity(opactyTapActive ? 0 : 1)
                        .foregroundColor(Color(red: 0.91, green: 0.58, blue: 0.44))
                        .position(x:doubleTapActive ? 600 : 220,y: flashAnimation ? 550 : 500)
                        .onAppear{
                            withAnimation(.linear(duration: 0.8).repeatForever(autoreverses: true)){
                                flashAnimation.toggle()
                                // withAnimation:모든 glow에 적용 .linear: 일정한속도, duration: 0.5초동안 반짝거리기 . repeatforever(autoreverses:true)끝없이 반복
                                
                            }
                        }
                    
                    Text("빠르게 두 번\n눌러볼까요?")
                        .font(.customTitle()).multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .opacity(doubleTapActive ? 0 : 1)
                        .position(x: geo.size.width / 2 , y : doubleTapActive ? geo.size.height/2.5 : geo.size.height/8.3)
                    
                    
                    Text("잘했어요!")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.customTitle())
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .opacity(doubleTapActive ? 1 : 0)
                        .position(x: geo.size.width / 2 , y : doubleTapActive ? geo.size.height/2.5 : geo.size.height/4)
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.6, blendDuration: 0.6)) {
                                opactyTapActive = true
                                doubleTapActive.toggle()
                                tapcount += 1
                                print(tapcount)
                                if tapcount >= 2 {
                                    oneMoreTapActive.toggle()
                                    
                                    //                                    nextViewAction()
                                }
                                print("dt : \(doubleTapActive)")
                                print("ot : \(oneMoreTapActive)")
                            }
                        }
                    
                    VStack{
                        Spacer()
                        Button {
                            nextViewAction()
                        } label: {
                            Text("다음").kerning(2)
                                .font(.customNextButton())
                        }
                        .btnStyle()
                        .opacity(opactyTapActive ? 1 : 0)
                    }
                    .padding(16)
                }
            }
        }
    }
}

struct DoubleTapView2_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapViewMain()
    }
}
