//
//  TapView.swift
//  MC2
//
//  Created by Uyeong on 2023/05/10.
//

import SwiftUI

struct TapView: View {
    @Binding var tag :Int
    @State private var ballSize : CGFloat = 100
    var body: some View {
        ZStack{
            VStack{
                Text("저를 한번\n눌러보세요.")
                    .font(.system(size: 40 , weight: .bold))
                    .frame(height: 200)
                Image("Bell")
        }
            VStack{
                Spacer()
                Button(action: {
                                tag += 1
                }) {
                    Image("TouchBall")
                        .resizable()
                        .scaledToFit()
                        .frame(width: ballSize,height: ballSize)
                        .animation(Animation.linear(duration: 1.5) .repeatForever(autoreverses: true))
                        .onAppear{
                            ballSize = 130
                        }
            }
                Spacer().frame(height : 200)
            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapViewMain()
    }
}
