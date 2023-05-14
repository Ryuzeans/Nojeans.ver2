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
    @State private var panActive: Bool = false
    
    @StateObject var state = StateViewModel()
    var body: some View {
        ScrollViewReader { proxy in
                    ZStack(alignment: .bottom){
                        VStack{
                            Spacer().frame(height: 40)
                            
                            ScrollView([.horizontal, .vertical],showsIndicators: false) {
                                
                                Image("PanMapOn")
                                    .resizable()
                                    .scaleEffect(0.7)
                                    
                            }
                            
                            if(!state.isPan){
                                Text("움직여 볼까요? ")
                                    .font(Font.customTitle())
                            }
                            else{
                                Text("잘 하셨어요")
                                    .font(Font.customTitle())
                            }

                        }
                        if(state.isPan){
                            Button(action: {
                                tag += 1
                            }, label: {Text("다음").font(Font.customNextButton()).kerning(2)}).btnStyle()
                        }
                    }.padding(16)
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

        Image("TouchBall")
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

