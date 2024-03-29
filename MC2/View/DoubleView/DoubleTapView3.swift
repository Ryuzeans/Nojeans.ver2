//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapView3: View {
    
    @State private var doubleTapActive: Bool = false
    @State private var buttonActive: Bool = false
    let nextViewAction: () -> Void
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack(spacing: 0){
                    
                    Text(buttonActive ? "잘하셨어요!\n" : "검색창을 두 번\n눌러볼까요?" )
                        .font(.customTitle())
                        .frame(maxWidth: .infinity,alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.top,40)
//                        .padding(.bottom,204)
                    
                    
                    Image("search_bar")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Image("paste_bar")
                                .resizable()
                                .scaledToFit()
//                                .opacity(doubleTapActive ? 1 : 0)
                                .frame(maxWidth: doubleTapActive ? .infinity :0)
                                .offset(x:-55 , y:-45)
                        )
                        .onTapGesture(count: 2) {
                            withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.5, blendDuration: 0.5)) {
                                doubleTapActive.toggle()
                                buttonActive = true
                            }
                        }
                        .padding(.top,200)
                        
                    Spacer()
                    
                }
                VStack(){
                    Spacer()
                    Button(action: {
                        nextViewAction()
                    }, label: {
                        Text("다음").kerning(2).font(.customNextButton())
                    })
                    .opacity(buttonActive ? 1 : 0)
                    .btnStyle()
                }
            }
            .padding(16)
        }
    }
}



struct DoubleTapView3_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapViewMain()
    }
}
