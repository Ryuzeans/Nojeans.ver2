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
                Spacer()
                Rectangle().frame(height: 0)
                Text("끌어 오기")
                    .font(.system(size: 40,weight: .bold))
                Text("(Drag)")
                    .font(.system(size: 30))
                    .foregroundColor(Color("SubTitleColor"))
                
                Image("TouchCircle")
                    .frame(width: 116, height: 116)
                VStack(alignment: .leading){
                    Rectangle().frame(height: 0)
                    Text("아이콘을 움직일 때,\n음량을 바꿀 때 사용해요")
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

//struct DragView0_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView0(tag: 0)
//    }
//}
