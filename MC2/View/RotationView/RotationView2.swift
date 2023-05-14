//
//  RotationView2.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct RotationView2: View {
    
    @State private var currentAmount = Angle.degrees(0)
    @State private var finalAmount = Angle.degrees(360)
    @State private var revolving = false
    @State private var rotate = false
    @Binding var tag : Int
    @State private var buttonTitleActive = false
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            Text(buttonTitleActive ? "잘하셨어요!\n" : "두 손을 돌려서\n하트를 제대로 볼까요?")
                .font(Font.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            
            HStack {
                if rotate {
                    HStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(Color("BrandColor"))
                            .frame(width: 80, height: 80)
                            .padding(32)
                    }
                    .frame(width: 300, height: 300)
                    .background(.quaternary)
                    .cornerRadius(45)
                    .rotationEffect(finalAmount)
                } else {
                    ZStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 80, height: 80)
                            .padding(32)
                            .rotationEffect(.degrees(90))
                            .overlay {
                                VStack(spacing: 40) {
                                    ArrowsRotate()
                                        .rotationEffect(.degrees(45))
                                    Image("TouchBall")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                }.offset(x: 100, y: -40)
                                
                                VStack(spacing: 40) {
                                    Image("TouchBall")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                    ArrowsRotate()
                                        .rotationEffect(.degrees(-135))
                                }.offset(x: -100, y: 40)
                            }
                    }
                    .frame(width: 300, height: 300)
                    .background(.quaternary)
                    .cornerRadius(45)
                    .rotationEffect(buttonTitleActive ? .degrees(-180) + currentAmount : currentAmount)
                }
            }
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        currentAmount = angle
                    }
                    .onEnded { angle in
                        if (currentAmount.degrees < -70 && currentAmount.degrees > -110) {
                            withAnimation(.easeOut(duration: 0.5)) {
                                rotate = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    buttonTitleActive = true
                                }
                            }
                        }
                        else {
                            print(currentAmount.degrees)
                            rotate = false
                        }
                    })
            
            Spacer()
            
            if buttonTitleActive {
                Button {
                    tag += 1
                } label: {
                    Text("다음").font(.customNextButton()).kerning(2)
                }.btnStyle().frame(height: 50)
            }
            else {
                Button { } label: {
                    Text("")
                }.frame(height: 50)
            }
        }.padding(16)
    }
}

struct RotationView2_Previews:PreviewProvider  {
    static var previews: some View {
        RotationView2(tag: .constant(2))
    }
}

struct ArrowsRotate: View {
    @State var scale: CGFloat = 1.0
    @State var fade: Double = 0.2
    @State var isAnimating: Bool = false
    
    var body: some View {
        HStack {
            ForEach(0..<3) { i in
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12, height: 22)
                    .foregroundColor(Color("BrandColor"))
                    .opacity(self.fade)
                    .offset(x: CGFloat(i+1) * 6, y: CGFloat(i+1))
                    .rotationEffect(.degrees(Double(i) * 24))
                    .animation(Animation
                        .easeOut(duration: 0.9)
                        .repeatForever(autoreverses: true)
                        .delay(0.3 * Double(3 - i)), value: isAnimating)
            }
        }
        .onAppear() {
            self.isAnimating = true
            self.scale = 1.1
            self.fade = 1.0
        }
    }
}
