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
    @Binding var selection: Int
    @State private var offset: CGFloat = 110
    @State var isOffsetAnimate: Bool = true
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            
            Text(showingPopover ? "\n" : "아래 원을 1초 동안\n눌러 볼까요?")
                    .font(.customTitle())
                    .multilineTextAlignment(.center)
            
            Spacer()
            
            ZStack {
                Image("ToucherCircle")
                    .resizable()
                    .frame(width: 116, height: 116)
                    .padding(.top, 112)
                    .scaleEffect(buttonAnimate ? 1.1 : 1.0)
                    .onAppear {
                        if !buttonActive {
                            withAnimation(.easeIn(duration: 0.8).repeatForever()) {
                                buttonAnimate.toggle()
                            }
                        }
                    }
                    .onLongPressGesture(minimumDuration: 1.0, perform: {
                        buttonActive = true
                        buttonAnimate = false
                        showingPopover.toggle()
                        isOffsetAnimate = false
                    }) { pressing in
                        if pressing {
                            // long press started, do something here
                        } else {
                            // long press ended, generate haptic feedback
                            let impactLight = UIImpactFeedbackGenerator(style: .medium)
                            impactLight.impactOccurred()
                        }
                    }
                
                VStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 68, height: 68)
                        .padding(16)
                    
                    Text("잘하셨어요!\n다음 버튼을 눌러 주세요!")
                        .font(.customTitle())
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, minHeight: 340)
                .background((Color(red: 0.95, green: 0.95, blue: 0.95)))
                .cornerRadius(36)
                .padding(.bottom, 300)
                .opacity(showingPopover ? 1.0 : 0.0)
                .scaleEffect(showingPopover ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 0.3).delay(0.1), value: showingPopover)
                
//                Image(systemName:"hand.point.up.fill")
//                    .resizable()
//                    .frame(width: 90, height: 120)
//                    .foregroundColor(Color(red: 0.91, green: 0.58, blue: 0.44))
//                    .offset(x: 10, y: isOffsetAnimate ? self.offset : 350)
//                    .opacity( isOffsetAnimate ? 1 : 0)
//                //.opacity( !showingPopover && !buttonActive ? 1 : 0)
//                //  .scaleEffect(!showingPopover && !buttonActive ? 1 : 0)
//                    .onAppear {
//                        withAnimation(.easeInOut(duration: 0.8).repeatForever()) {
//                            self.offset = 150
//                        }
//                    }
//                    .animation(Animation.easeOut(duration: 0.4), value: !showingPopover && !buttonActive )
//                    .animation(Animation.easeInOut(duration: 0.8).repeatForever(), value: isOffsetAnimate)
//
            }.frame(height: 300)
            
            Spacer()
            
            if buttonActive {
                Button {
                    selection = 2
                } label: {
                    Text("다음").font(.customNextButton()).kerning(2)
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
