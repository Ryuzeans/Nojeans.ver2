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
        ZStack(alignment: .bottom){
            VStack{
                Rectangle().frame(height: 0)
                Spacer().frame(height: 41)
                Rectangle().frame(height: 0)
                Text("끌어 오기")
                    .font(Font.customTitle())
                Text("(Drag)")
                    .font(.customEngTitle())
                    .foregroundColor(Color("SubTitleColor"))
                Spacer().frame(height: 105)
                Image("drag_seq")
                Spacer().frame(height: 100)
                VStack(alignment: .leading){
                    Text("아이콘을 움직일 때,")
                        .font(Font.customExplainEmphasis())
                        .padding(.bottom,0.5)
                    HStack{
                        Text("음량을 바꿀 때 ")
                            .font(Font.customExplainEmphasis())
                        Text("사용해요,")
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

//struct DragView0_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView0(tag: 0)
//    }
//}
