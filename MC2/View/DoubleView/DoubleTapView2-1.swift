//
//  DoubleTapView2-1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/10.
//

import SwiftUI

struct DoubleTapView2_1: View {
    
    @State private var doubleTapActive: Bool = false
    @State private var tapcount: Int = 0
    let nextViewAction: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack() {
                    
                    Image("DoubleCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: doubleTapActive ? .infinity : 100 )
                        .frame(height: doubleTapActive ? geo.size.height/2 : geo.size.height / 3)
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.5, blendDuration: 0.5)) {
                                tapcount += 1
                                doubleTapActive.toggle()
                                print(tapcount)
                            }
                        }
                        .padding(.horizontal,25)
                    
                    Text("마지막으로\n한 번 더!")
                        .font(.customTitle())
                        .frame(maxWidth: .infinity)
                        .opacity(doubleTapActive ? 0 : 1)
                        .position(x: geo.size.width / 2 , y : doubleTapActive ? geo.size.height/2 : geo.size.height/6.5)
                    
                    Text("잘하셨어요!")
                        .foregroundColor(.white)
                        .font(.customTitle())
                        .frame(maxWidth: .infinity)
                        .opacity(doubleTapActive ? 1 : 0)
                        .position(x: geo.size.width / 2 , y : doubleTapActive ? geo.size.height/2 : geo.size.height/4)
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.5, blendDuration: 0.5)) {
                                doubleTapActive.toggle()
                                tapcount += 1
                                print(tapcount)
                            }
                        }
                    
                    VStack(){
                        Spacer()
                        Button("다음") {
                            nextViewAction()
                        }
                        .opacity(doubleTapActive ? 1 : 0)
                        .btnStyle()
                        .padding(.horizontal,16)
                        
                    }
                }
            }
        }
    }
    
}

struct DoubleTapView2_1_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
