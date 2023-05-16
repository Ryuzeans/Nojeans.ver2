//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//


import SwiftUI

struct DoubleTapView1: View {
    
    let nextViewAction: () -> Void
    
    var body: some View {
        VStack {
            Text("두 번 누르기")
                .font(.customTitle())
                .padding(.top, 40)
            Text("Double Tap")
                .foregroundColor(Color("SubTitleColor"))
                .font(.customEngTitle())
            Spacer()
            
            Image("DoubleCircle 1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Spacer()
            
            HStack {
                Text("사진을 확대/축소")
                    .font(.customExplainEmphasis()) +
                Text("할 때,\n")
                    .font(.customExplain()) +
                Text("글자를 수정")
                    .font(.customExplainEmphasis()) +
                Text("할 때\n사용해요")
                    .font(Font.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal,16)
            
            Button(action: {
                nextViewAction()
            }, label: { Text("다음").font(Font.customNextButton()).kerning(2)}).btnStyle()
        }.padding(16)
    }
}

struct DoubleTapView1_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
