//
//  DragView0.swift
//  MC2
//
//  Created by musung on 2023/05/09.
//

import SwiftUI

struct DragView0: View {
    @Binding var tag :Int
    var body: some View {
        VStack{
            Spacer().frame(height: 40)
            Text("끌어 오기")
                .font(Font.customTitle())
            Text("Drag")
                .font(.customEngTitle())
                .foregroundColor(Color("SubTitleColor"))
            Spacer()
            
            Image("drag_seq")
                .resizable()
                .frame(width: 116, height: 156)
            Spacer()
            
            HStack {
                Text("아이콘을 움직일 때,\n")
                    .font(Font.customExplainEmphasis()) +
                Text("음량을 바꿀 때 ")
                    .font(Font.customExplainEmphasis()) +
                Text("사용해요")
                    .font(Font.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal,16)
            
            Button(action: {
                tag += 1
            }, label: {Text("다음").font(Font.customNextButton()).kerning(2)}).btnStyle()
        }.padding(16)
    }
}

//struct DragView0_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView0(tag: 0)
//    }
//}
