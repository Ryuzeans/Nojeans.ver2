//
//  DragView2.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct DragView2: View {
    @Binding var tag :Int
    @State private var sliderValue = 0.0
    @State private var isEnd = false
    var body: some View {
        VStack{
            Spacer().frame(height: 40)
            if(!isEnd){
                Text("원을 좌우로\n움직여보세요")
                    .font(Font.customTitle())
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            else{
                Text("잘하셨어요!\n")
                    .font(Font.customTitle())
                    .multilineTextAlignment(.center)
                    .padding(10)
            }
            Spacer()
            ZStack{
                Slider(value: $sliderValue)
                .onChange(of: sliderValue, perform: { value in
                    if sliderValue > 0.8 {
                        isEnd = true
                    }
                })
                .frame(width: 300, height:50)
                .tint(Color("BrandColor"))
//                Arrows()
//                    .rotationEffect(.degrees(180))
            }
            
            Spacer()
            
            if(isEnd){
                Button(action: {
                    tag += 1
                }) {
                    Text("다음").font(Font.customNextButton()).kerning(2)
                }.btnStyle().frame(height: 50)
            } else {
                Spacer().frame(height: 50)
            }
        }.padding(16)
    }
}

//struct DragView2_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView2()
//    }
//}
