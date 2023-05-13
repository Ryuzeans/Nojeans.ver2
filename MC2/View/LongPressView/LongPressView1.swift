//
//  LongPressView1.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct LongPressView1: View {
    @State var buttonActive: Bool = false
    @State private var showingPopover = false
    @State var buttonAnimate: Bool = true
    @GestureState var  isUpdating = false
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Text("아래 원을 1초 동안\n눌러 볼까요?")
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Spacer()
            
            ZStack {
                Image("TouchBall")
                    .resizable()
                    .frame(width: 116, height: 116)
                    .padding(.top, 36)
                    .scaleEffect(buttonAnimate ? 0.9 : 1.0)
                    .opacity(buttonAnimate ? 0.8 : 1.0)
                    .onAppear {

                        if !buttonActive {
                            withAnimation(.easeIn(duration: 0.8).repeatCount(6)) {

                                buttonAnimate.toggle()
                            }
                        }
                    }
                    
                    .onLongPressGesture(minimumDuration: 1.0, perform: {
                        buttonActive = true
                        buttonAnimate = false
                        showingPopover.toggle()
                    })
                
                if showingPopover {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 60, height: 60)
                        .padding(32)
                        .background(.quaternary)
                        .cornerRadius(36)
                        .padding(.bottom, 232)
                }
//                Image("hand")
//                    .resizable()
//                    .frame(width: 60, height: 60)
//                    .scaleEffect(isUpdating ? 1.5 : 1.0)
//                    .rotationEffect(isUpdating ? .degrees(15) : .degrees(0))
//                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                
                
            }.frame(height: 300)
            
            Spacer()
            
            if buttonActive {
                Button {
                    selection = 2
                } label: {
                    Text("다음").font(.customNextButton())
                }.btnStyle()
                    .frame(height: 50)
            }
            else {
                Button {
                } label: {
                    Text("").font(.customNextButton())
                }
                .frame(height: 50)
            }
        }.padding(16)
    }
}

struct LongPressView1_Previews: PreviewProvider {
    static var previews: some View {
        LongPressView1(selection: .constant(1))
    }
}
