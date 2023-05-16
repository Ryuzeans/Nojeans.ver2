//
//  SwipeView1.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct SwipeView1: View {
    @State private var selectedIndex: Int = 0
    @State private var titles: [String] = ["가볍게 왼쪽으로\n밀어볼까요?", "이번엔 오른쪽으로\n밀어볼까요?", "잘하셨어요!\n"]
    @State private var did: Bool = false
    @Binding var swpSelection: Int
    @State private var offset: CGFloat = 50
    
    var body: some View {
        VStack {
            Text(titles[selectedIndex])
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                
                ZStack {
                    Rectangle()
                        .frame(width: 400, height: 300)
                        .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(38)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 0, y: 0)
                        .padding(.horizontal, 60)
                }
                .frame(height: 420)
                .edgesIgnoringSafeArea(.all)
                .overlay {
                    if selectedIndex == 0 {
                        HStack(spacing: 26) {
                            Arrows()
                            Image("ToucherCircle")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                        .offset(x: 0, y: 40)
                        
//                        Image(systemName:"hand.point.up.fill")
//                            .resizable()
//                            .frame(width: 90, height: 120)
//                            .foregroundColor(Color(red: 0.91, green: 0.58, blue: 0.44))
//                            .offset(x: self.offset, y: 150 )
//                            .onAppear {
//                                withAnimation(.easeInOut(duration: 0.9).repeatForever()) {
//                                    self.offset = 0
//                                }
//                            }
                    }
                    
                    else if selectedIndex == 1 {
                        HStack(spacing: 26) {
                            Image("ToucherCircle")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Arrows().rotationEffect(.degrees(180))
                        }.offset(x: 0, y: 40)
                    }
                }
            }
            
            .gesture(DragGesture()
                .onChanged({ value in
                    if value.translation.width > 0 && did == false {
                        did = true
                        selectedIndex = 0
                    }
                    else if value.translation.width < 0  && did == false {
                        did = true
                        selectedIndex = 1
                    }
                    else if value.translation.width > 0 && did == true {
                        selectedIndex = 2
                    }
                    else if value.translation.width < 0  && did == true {
                        selectedIndex = 2
                    }
                })
            )
            
            Spacer()
            Group {
                if selectedIndex == 2 {
                    Button {
                        swpSelection = 2
                    } label: {
                        Text("다음").font(.customNextButton()).kerning(2)
                    }
                    .btnStyle()
                    .frame(height: 50)
                }
                
                else {
                    Button {
                    } label: {
                        Text("")
                    }
                    .frame(height: 50)
                }
            }.padding(16)
        }.padding(.top, 16)
    }
}


struct SwipeView1_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView1(swpSelection: .constant(1))
    }
}


struct Arrows: View {
    @State var scale:CGFloat = 1.0
    @State var fade:Double = 0.2
    @State var isAnimating: Bool = false
    
    var body: some View {
        HStack(spacing: 6){
            ForEach(0..<3) { i in
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12, height: 22)
                    .foregroundColor(Color("BrandColor"))
                    .opacity(self.fade)
                    .scaleEffect(self.scale)
                    .animation(Animation.easeOut(duration: 0.9)
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


