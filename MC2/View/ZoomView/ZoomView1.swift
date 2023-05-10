//
//  ZoomView1.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct ZoomView1: View {
    @Binding var tag :Int
    static let uperCircleCGSize : CGSize = CGSize(width: 47, height: -47)
    static let underCircleCGSize : CGSize = CGSize(width: -47, height: 47)
    //
    @State private var draggedOffset1 = uperCircleCGSize
    @State private var accumulatedOffset1 = uperCircleCGSize
    //
    @State private var draggedOffset2 = underCircleCGSize
    @State private var accumulatedOffset2 = underCircleCGSize
    @State private var changedSize : CGSize = CGSize(width: 42,height: 22)
    @State private var isFan = false
    @State private var isFold = false
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                Spacer().frame(height:100)
                if(isFan && !isFold){
                    Text("이번엔 원을\n가운데로 모아볼까요?")
                        .font(.system(size: 40,weight: .bold))
                }
                else if(isFan && isFold){
                    Text("잘 하셨어요!\n")
                        .font(.system(size: 40,weight: .bold))
                }
                else{
                    Text("원 위에 손을 올리고\n원을 벌려보세요.")
                        .font(.system(size: 40,weight: .bold))
                }
                ZStack{
                    Rectangle()
                        .frame(width: changedSize.width * 1.5, height: changedSize.height * 1.5)
                        .cornerRadius(10)
                        .foregroundColor(Color("SubTitleColor"))
                    Image("TouchCircle")
                        .resizable()
                        .frame(width: 116,height: 116)
                        .offset(draggedOffset1)
                        .gesture(upperDrag)
                    Image("TouchCircle")
                        .resizable()
                        .frame(width: 116,height: 116)
                        .offset(draggedOffset2)
                    //                .gesture(underDrag)
                }.frame(height : 300)
                Spacer()
            }
            if(isFan && isFold){
                Button(action: {
                    tag += 1
                }) {
                    Text("다음")
                }.btnStyle()
            }
            Spacer()
        }
    }
    var upperDrag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                var dx = gesture.translation.width
                var dy = gesture.translation.height
                if dx < 0 {
                    dx = 0
                }
                if dy > 0{
                    dy = 0
                }
                if dx > 80{
                    dx = 80
                }
                if dy < -80{
                    dy = -80
                }
                if(dx > 70 && dy < -70){
                    isFan = true;
                }
                if(dx < 10 && dy > -10 && isFan){
                    isFold = true
                }
                changedSize = CGSize(width: dx, height: -dy) + CGSize(width: 42,height: 22)
                let upperCircle = CGSize(width: dx, height: dy)
                let underCircle = CGSize(width: -dx, height: -dy)
                draggedOffset1 = accumulatedOffset1 + upperCircle
                draggedOffset2 = accumulatedOffset2 + underCircle
            }
            .onEnded { gesture in
                
            }
    }
}

//struct ZoomView1_Previews: PreviewProvider {
//    static var previews: some View {
//        ZoomView1()
//    }
//}
