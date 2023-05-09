//
//  PanView1.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/07.
//

import SwiftUI

struct PanView1: View {
    @State private var imagePosition = CGPoint(x: 200, y: 350)
    @State private var joystickPosition = CGSize.zero
    @State private var showInitialText = 0
    @Binding var tag :Int
    
    var body: some View {
        
        ZStack {
            if showInitialText == 0{
                Image("PanMapOff")
                    .resizable()
                    .frame(width: 900,height: 1200)
                    .position(imagePosition)
            } else {
                Image("PanMapOn")
                    .resizable()
                    .frame(width: 900,height: 1200)
                    .position(imagePosition)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                value in
                                joystickPosition = value.translation
                            }
                            .onEnded { _ in
                                joystickPosition = .zero
                                updateImagePosition()
                            }
                    )
                    .offset(x: joystickPosition.width, y: joystickPosition.height)
            }
                            
            VStack {
                
                if showInitialText  == 0 {
                    Text("숨어있는\n도형들을\n찾아볼까요?")
                        .font(.system(size: 48,weight: .bold))
                        .multilineTextAlignment(.center)
                } else if showInitialText == 1{
                    Text("원을\n상하좌우로\n움직여보세요!")
                        .font(.system(size: 48,weight: .bold))
                        .multilineTextAlignment(.center)
                } else {
                    Text("잘하셨어요!\n이제 뭐든\n 찾을 수 있어요!")
                        .font(.system(size: 48,weight: .bold))
                        .multilineTextAlignment(.center)
                }
                
                PanJoyStickView(joystickposition: $joystickPosition)
                    .padding(.bottom, 50)
            }
            
            Button {
                tag += 1
            } label: {
                Text("다음")
            }
            .btnStyle()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeOut) {
                    showInitialText = 1
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                withAnimation(.easeOut) {
                    showInitialText = 2
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                withAnimation(.easeOut) {
                    self.tag = 2
                }
            }
            
        }
    }
    
    private func updateImagePosition() {
        withAnimation(.easeInOut){
            let x = imagePosition.x + joystickPosition.width / 10
            let y = imagePosition.y + joystickPosition.height / 10
            
            imagePosition = CGPoint(x: x, y: y)
        }
    }
}

struct PanJoyStickView: View {
    @Binding var joystickposition: CGSize
    
    var body: some View {

        Image("PanCircle")
            .resizable()
            .frame(width: 100, height: 100)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        joystickposition = value.translation
                    }
                    .onEnded { _ in
                        joystickposition = .zero
                    }
            )
        
                   
    }
}


