//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapView3: View {
    
    @State private var doubleTapActive: Bool = false
    let nextViewAction: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack(spacing: 0){
                    
                    Text(doubleTapActive ? "\n잘하셨어요!" : "검색창을 두 번 \n눌러볼까요?" )
                        .font(.customTitle())
                        .frame(maxWidth: .infinity,alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.top,43)
                        .padding(.bottom,214)
                        
                        

                    
                    Image("search_bar")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Image("paste_bar")
                                .resizable()
                                .scaledToFit()
                                .opacity(doubleTapActive ? 1 : 0)
                                .frame(maxWidth: .infinity)
                                .offset(x:-70 , y:-40)
                        )
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.5, blendDuration: 0.5)) {
                                doubleTapActive.toggle()
                            }
                        }
                        
                    Spacer()
                    
                    
                    
                }
                VStack(){
                    Spacer()
                    Button("다음") {
                        nextViewAction()
                    }
                    .opacity(doubleTapActive ? 1 : 0)
                    .btnStyle()
                }
            }
        }
    }
}



struct DoubleTapView3_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView()
    }
}
