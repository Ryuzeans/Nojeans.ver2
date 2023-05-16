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
    let goalOffset = CGSize(width: 0, height: 297)
    @State private var draggedOffset = defaultCGSize
    @State private var accumulatedOffset = defaultCGSize
    @State private var isArrived: Bool = false
    @State private var isEnded: Bool = false
    @State private var animationAmount: CGFloat = 1
    @State private var strokeAnimation: CGFloat = 0
    @State private var onClicked = false
    @State private var onLongPressed = false
    var body: some View {
        let longPressGesture = LongPressGesture().onEnded { item in
            withAnimation(.easeOut){
                onLongPressed = true
            }
        }
        ZStack(alignment:.bottom){
            ZStack{
                VStack{
                    Spacer().frame(height: 40)
                    VStack{
                        Rectangle().frame(height: 0)
                        if(onLongPressed){
                            if(!isEnded){
                                Text("원을 구멍 안으로\n옮겨보세요")
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
                        }
                        else{
                        Text("아래의 빨간 원을\n2초간 눌러 볼까요?")
                                .font(Font.customTitle())
                                .multilineTextAlignment(.center)
                                .padding(10)
                        }
                    }
                    Spacer().frame(height: 300)
                    ZStack{
                        Image("GoalCircle")
                            .resizable()
                            .frame(width: 116, height: 116)
                        Circle()
                            .stroke(Color.yellow, lineWidth: strokeAnimation)
                            .frame(width: 100, height: 100)
                            .scaleEffect(animationAmount)
                            .opacity(Double(2 - animationAmount))
                    }
                    Spacer()
                    }
                ZStack{
                    VStack{
                        Spacer().frame(height:175)
                        Image("TouchBall")
                            .resizable()
                            .frame(width: !onLongPressed || onClicked ? 100 : 140,
                                   height: !onLongPressed || onClicked ? 100 : 140)
                        if(!onLongPressed){
                            Arrows()
                                .rotationEffect(.degrees(270))
                                .padding(16)
                        }
                        else{
                            Spacer().frame(height: 44)
                        }
                        Spacer()
                    }

                    if(!onLongPressed){
                        Image(systemName: "exclamationmark")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                }
                .offset(draggedOffset)
                .gesture(longPressGesture.sequenced(before: drag))

            }
            if isEnded{
                Button(action: {
                    tag += 1
                }, label: {Text("다음").font(Font.customNextButton()).kerning(2)}).btnStyle().padding(16)
            }
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
            withAnimation(.easeOut(duration: 1)){
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
                onClicked = false
                onLongPressed = false
            }
        }
    }
  }

extension CGSize {
  static func + (lhs: Self, rhs: Self) -> Self {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
  }
}

struct DragView1_Previews: PreviewProvider {
    static var previews: some View {
        DragView1(tag: .constant(1))
    }
}
