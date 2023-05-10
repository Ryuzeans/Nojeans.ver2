//
//  ZoomView0.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct ZoomView0: View {
    @Binding var tag :Int
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                Spacer()
                Rectangle().frame(height: 0)
                Text("확대 축소하기")
                    .font(.system(size: 40,weight: .bold))
                Text("(Zoom in, out)")
                    .font(.system(size: 30))
                    .foregroundColor(Color("SubTitleColor"))
                
                Image("TouchCircle")
                    .frame(width: 116, height: 116)
                VStack(alignment: .leading){
                    Rectangle().frame(height: 0)
                    Text("사진, 웹 페이지를\n확대/축소할 때 사용해요")
                        .font(.system(size: 32,weight: .bold))
                        .padding(10)
                }
                Spacer()
            }
            Button(action: {
                tag += 1
            }, label: {Text("다음")}).btnStyle()
        }
    }
}

//struct ZoomView0_Previews: PreviewProvider {
//    static var previews: some View {
//        ZoomView0()
//    }
//}
