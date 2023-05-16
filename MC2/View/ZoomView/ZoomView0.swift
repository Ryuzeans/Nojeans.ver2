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
        VStack {
            Text("확대 축소하기")
                .font(Font.customTitle())
                .padding(.top, 40)
            Text("Zoom in, out")
                .font(Font.customEngTitle())
                .foregroundColor(Color("SubTitleColor"))
            Spacer()
            
            Image("zoomView_circle")
                .resizable()
                .frame(width: 250, height: 250)
            Spacer()
            
            HStack {
                Text("사진, 웹 페이지")
                    .font(.customExplainEmphasis()) +
                Text("를\n")
                    .font(.customExplain()) +
                Text("확대/축소")
                    .font(.customExplainEmphasis()) +
                Text("할 때 사용해요")
                    .font(Font.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal,16)
            
            Button(action: {
                tag += 1
            }, label: { Text("다음").font(Font.customNextButton()).kerning(2)}).btnStyle()
        }.padding(16)
    }
}

//struct ZoomView0_Previews: PreviewProvider {
//    static var previews: some View {
//        ZoomView0()
//    }
//}
