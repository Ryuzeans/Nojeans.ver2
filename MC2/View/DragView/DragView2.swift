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
        ZStack(alignment: .bottom){
            VStack{
                Spacer().frame(height: 100)
                if(!isEnd){
                    Text("원을\n좌우로\n움직여보세요")
                        .font(Font.customExplain())
                        .padding(10)
                }
                else{
                    Text("잘하셨어요\n\n")
                        .font(Font.customExplain())
                        .padding(10)
                }
                Spacer().frame(height: 100)
                Slider(value: $sliderValue){
                    Image("PanCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .onChange(of: sliderValue, perform: { value in
                    if sliderValue > 0.9{
                        isEnd = true
                    }
                })
                .frame(width: 300, height:50)
                .tint(Color("BrandColor"))
                Spacer()
            }
            if(isEnd){
                Button(action: {
                    tag += 1
                }) {
                    Text("다음").font(Font.customNextButton())
                }.btnStyle().padding(16)
            }
        }
    }
}

//struct DragView2_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView2()
//    }
//}
