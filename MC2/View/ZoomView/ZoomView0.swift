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
                Spacer().frame(height: 41)
                Rectangle().frame(height: 0)
                Text("확대 축소하기")
                    .font(Font.customTitle())
                Text("(Zoom in, out)")
                    .font(Font.customEngTitle())
                    .foregroundColor(Color("SubTitleColor"))
                Image("zoomView_circle")
                    .frame(width: 116, height: 116)
                    .padding(100)
                VStack(alignment: .leading){
                    HStack{
                        Text("사진, 웹 페이지")
                            .font(Font.customExplainEmphasis())
                            .padding(.bottom,0.5)
                        Text("를")
                            .font(Font.customExplain())
                    }
                    HStack{
                        Text("확대/축소")
                            .font(Font.customExplainEmphasis())
                            .padding(.bottom,0.5)
                        Text("할 때 사용해요")
                            .font(Font.customExplain())
                    }
                        
                }
                Spacer()
            }
            Button(action: {
                tag += 1
            }, label: {Text("다음").font(Font.customNextButton())}).btnStyle().padding(16)
        }
    }
}

//struct ZoomView0_Previews: PreviewProvider {
//    static var previews: some View {
//        ZoomView0()
//    }
//}
