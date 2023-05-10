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
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                Spacer().frame(height: 100)
                if(sliderValue < 0.9){
                    Text("원을\n좌우로\n움직여보세요")
                        .font(.system(size: 40,weight: .bold))
                        .padding(10)
                }
                else{
                    Text("잘하셨어요\n\n")
                        .font(.system(size: 40,weight: .bold))
                        .padding(10)
                }
                Spacer().frame(height: 100)
                Slider(value: $sliderValue){
                    Image("PanCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                    .tint(Color("BrandColor"))
                Spacer()
            }
            if(sliderValue > 0.9){
                Button(action: {
                    tag += 1
                }) {
                    Text("다음")
                }.btnStyle()
            }
        }
    }
}

//struct DragView2_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView2()
//    }
//}
