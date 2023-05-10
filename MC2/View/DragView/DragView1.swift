//
//  DragView1.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct DragView1: View {
    @Binding var tag :Int
    static let defaultCGSize : CGSize = CGSize(width: 0, height: 0)
    let goalOffset = CGSize(width: 0, height: 177)
    @State private var draggedOffset = defaultCGSize
    @State private var accumulatedOffset = defaultCGSize
    @State private var isArrived: Bool = false
    @State private var isEnded: Bool = false
    @State private var animationAmount: CGFloat = 1
    @State private var strokeAnimation: CGFloat = 0
    @State private var onClicked = false
    @State private var onLongPressed = false
    var body: some View {
        ZStack(alignment:.bottom){
            ZStack{
                VStack{
                    Spacer().frame(height: 133)
                    VStack{
                        Rectangle().frame(height: 0)
                        if(onLongPressed){
                            if(!isEnded){
                                Text("원을\n구멍 안으로\n옮겨보세요")
                                    .font(.system(size: 40,weight: .bold))
                                    .padding(10)
                            }
                            else{
                                Text("잘하셨어요")
                                    .font(.system(size: 40,weight: .bold))
                                    .padding(10)
                            }
                        }
                        else{
                            Text("아래의 원을 \n2초간 눌러 볼까요?")
                                .font(.system(size: 40,weight: .bold))
                                .padding(10)
                        }
                    }
                    Spacer()
                    if(!onLongPressed){
                        Image("Arrow")
                            .resizable()
                            .frame(width: 22, height: 44)
                    }
                    else{
                        Spacer().frame(height: 44)
                    }
                    Image("GoalCircle")
                        .frame(width: 121, height: 121)
                    Spacer().frame(height: 141)
                    }
                ZStack{
                    Image("TouchCircle")
                        .resizable()
                        .frame(width: !onLongPressed || isArrived ? 116 : 152,
                               height: !onLongPressed || isArrived ? 116 : 152)
                    if(!onLongPressed){
                        Image(systemName: "exclamationmark")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Circle()
                        .stroke(Color.yellow, lineWidth: strokeAnimation)
                        .frame(width: 100, height: 100)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                }
                .offset(draggedOffset)
                .onLongPressGesture{
                    withAnimation(.easeOut){
                        onLongPressed = true
                    }
                }
                .gesture(drag)
            }
            Button(action: {
                tag += 1
            }) {
                Text("다음")
            }.btnStyle()
        }
        }
    func isMatch() -> Void{
        withAnimation(.easeIn(duration: 0.5)){
            if draggedOffset.width < goalOffset.width + 50 &&
                draggedOffset.width > goalOffset.width - 50 &&
                draggedOffset.height < goalOffset.height + 50 &&
                draggedOffset.height > goalOffset.height - 50{
                isArrived = true
            }
            else{
                isArrived = false
            }
        }
    }
    var drag: some Gesture {
      DragGesture()
        .onChanged { gesture in
            withAnimation(.easeOut){
                onClicked = true
                isMatch()
            }
            draggedOffset = accumulatedOffset + gesture.translation
        }
        .onEnded { gesture in
            if isArrived{
                withAnimation(.easeOut(duration: 0.6)){
                    draggedOffset = goalOffset
                }
                DispatchQueue.main.asyncAfter(deadline:.now() + .milliseconds(500)){
                    isEnded = true
                    withAnimation(.easeOut(duration: 1)){
                        animationAmount = 2
                        strokeAnimation = 2
                    }
                }
            }
            else{
                draggedOffset = DragView1.defaultCGSize
            }
        }
    }
  }

extension CGSize {
  static func + (lhs: Self, rhs: Self) -> Self {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
  }
}

//struct DragView1_Previews: PreviewProvider {
//    static var previews: some View {
//        DragView1()
//    }
//}
