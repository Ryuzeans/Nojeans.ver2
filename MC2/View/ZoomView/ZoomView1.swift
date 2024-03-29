//
//  ZoomView1.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct ZoomView1: View {
    @Binding var tag :Int
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
//    static let uperCircleCGSize : CGSize = CGSize(width: 47, height: -47)
//    static let underCircleCGSize : CGSize = CGSize(width: -47, height: 47)
//    //
//    @State private var draggedOffset1 = CGSize(width: 47, height: -47)
//    @State private var accumulatedOffset1 = CGSize(width: 47, height: -47)
//    //
//    @State private var dx: CGFloat = .zero
//    @State private var dy: CGFloat = .zero
//
//    @State private var draggedOffset2 = CGSize(width: -47, height: 47)
//    @State private var accumulatedOffset2 = CGSize(width: -47, height: 47)
//
    @State private var isDraged = false
    @State private var isFan = false
    @State private var isFold = false
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                Spacer().frame(height: 40)
                Rectangle().frame(height:0)
                if(isFan && !isFold){
                    Text("이번엔 하트를\n줄여 볼까요?")
                        .font(Font.customTitle())
                        .multilineTextAlignment(.center)
                }
                else if(isFan && isFold){
                    Text("잘하셨어요!\n")
                        .font(Font.customTitle())
                        .multilineTextAlignment(.center)
                }
                else{
                    Text("원 위에 손을 올리고\n손을 벌려보세요")
                        .font(Font.customTitle())
                        .multilineTextAlignment(.center)
                    
                }
                ZStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .scaleEffect(finalAmount + currentAmount)
                        .foregroundColor(Color.red)
                        
            
                    VStack{
                        VStack{
                            Image("zoomView_right").padding(.leading,150)
                            Image("TouchBall")
                        }.offset(CGSize(width: 40, height: 10))
                        VStack{
                            Image("TouchBall")
                            Image("zoomView_left").padding(.trailing,160)
                        }.offset(CGSize(width: -30, height: -10))
                    }.opacity(isDraged ? 0: 1)
                    
                }
                Spacer()
            }
                if(isFan && isFold){
                    Button(action: {
                        tag += 1
                    }, label: {Text("다음").font(Font.customNextButton()).kerning(2)}).btnStyle().padding(16)
                }
        }.background(Color.white)
        .gesture(
            MagnificationGesture()
                .onChanged { amount in
                    isDraged = true
                    currentAmount = amount - 1
                    if finalAmount + currentAmount > 4{
                        isFan = true
                    }
                    if isFan && finalAmount + currentAmount < 3.5{
                        isFold = true
                    }
                    print(amount)
                }
                .onEnded { amount in
                    finalAmount += currentAmount
                    currentAmount = 0
                }
        )
//        ZStack(alignment: .bottom){
//            VStack{
//                Spacer().frame(height: 40)
//                if(isFan && !isFold){
//                    Text("이번엔 원을\n가운데로 모아볼까요?")
//                        .font(Font.customTitle())
//                        .multilineTextAlignment(.center)
//                }
//                else if(isFan && isFold){
//                    Text("잘하셨어요!\n")
//                        .font(Font.customTitle())
//                        .multilineTextAlignment(.center)
//                }
//                else{
//                    Text("원 위에 손을 올리고\n손을 벌려보세요")
//                        .font(Font.customTitle())
//                        .multilineTextAlignment(.center)
//                }
//                if !isDraged{
//                    VStack(alignment: .trailing){
//                        Rectangle().frame(height:0)
//                        Image("zoomView_right")
//                            .padding(.trailing, 48.0)
//                    }.frame(height:100)
//                }
//                else{
//                    Spacer().frame(height: 100)
//                }
//                ZStack{
//                    Rectangle()
//                        .frame(width: draggedOffset1.width * 1.3, height: -draggedOffset1.height * 0.8)
//                        .cornerRadius(10)
//                        .foregroundColor(Color("SubTitleColor"))
//                    Image("TouchBall")
//                        .resizable()
//                        .frame(width: 116,height: 116)
//                        .offset(draggedOffset1)
//                        .gesture(upperDrag)
//                    Image("TouchBall")
//                        .resizable()
//                        .frame(width: 116,height: 116)
//                        .offset(draggedOffset2)
//                }.frame(height : 200)
//                if !isDraged{
//                    VStack(alignment: .leading){
//                        Rectangle().frame(height:0)
//                        Image("zoomView_left")
//                            .padding(.leading, 48.0)
//                            .frame(height:100)
//                    }
//                }
//                else{
//                    Spacer().frame(height:100)
//                }
//                Spacer()
//            }
//            if(isFan && isFold){
//                Button(action: {
//                    tag += 1
//                }, label: {Text("다음").font(Font.customNextButton())}).btnStyle().padding(16)
//            }
//            Spacer()
//        }
    }
//    var upperDrag: some Gesture {
//        DragGesture()
//            .onChanged { gesture in
//                isDraged = true
//                dx = gesture.translation.width
//                dy = gesture.translation.height
////                if (draggedOffset1.width - 47) < 0 {
////                    dx = 0
////                }
////                if (draggedOffset1.width - 47) > 80{
////                    dx = 80
////                }
////                if (draggedOffset1.height + 47) > 0{
////                    dy = 0
////                }
////                if (draggedOffset1.height + 47) < -80{
////                    dy = -80
////                }
//                if(dx > 70 && dy < -70){
//                    isFan = true;
//                }
//                if(dx < 10 && dy > -10 && isFan){
//                    isFold = true
//                }
//                draggedOffset1 = accumulatedOffset1 + CGSize(width: dx, height: dy)
//                draggedOffset2 = accumulatedOffset2 + CGSize(width: -dx, height: -dy)
//            }
//            .onEnded { gesture in
//                accumulatedOffset1 = accumulatedOffset1 + CGSize(width: dx, height: dy)
//                accumulatedOffset2 = accumulatedOffset2 + CGSize(width: -dx, height: -dy)
//            }
//    }
}

//struct ZoomView1_Previews: PreviewProvider {
//    static var previews: some View {
//        ZoomView1()
//    }
//}
