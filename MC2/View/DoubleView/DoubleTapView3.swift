//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapView3: View {
    
    @State private var doubleTapActive: Bool = false

    
    var body: some View {
        GeometryReader { geo in
            VStack() {
                
                
                Text("검색창을 두 번 \n눌러볼까요?" )
                    .font(.system(size: 48).weight(.black))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top,148)
                    .padding(.bottom,100)
                    
                    

                
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
                
                Text("검색창을 두 번 누르면\n복사한 글을 붙여 넣을 수 있어요" )
                    .font(.system(size: 28).weight(.black))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top,40)
                    .opacity(doubleTapActive ? 1 : 0)
                    

                

                
            }
            .padding(.horizontal,16)
//            .frame(width: geo.size.width, height: geo.size.height)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}



struct DoubleTapView3_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView3()
    }
}
