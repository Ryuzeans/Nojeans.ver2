//
//  TapView2.swift
//  MC2
//
//  Created by Uyeong on 2023/05/10.
//

import SwiftUI

struct TapView2: View {
    @Binding var tag :Int
    @State private var ballSize : CGFloat = 100

    
    var body: some View {
        VStack{
            
            Text("잘하셨어요!\n이제 부터 저의 설명에 따라\n터치 여행을 떠나봐요.")
                .font(.system(size: 40 , weight: .bold))
                .frame(height : 200)

                Image("TouchBall")
                }
                
                Button(action: {
                    tag += 1
                }) {
                Image("RButton")
                .padding(.top,700)
                    
                }
                
            }
    }
    

struct TapView2_Previews: PreviewProvider {
    static var previews: some View {
        TapViewMain()
    }
}
