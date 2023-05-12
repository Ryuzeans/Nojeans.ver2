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
    @GestureState private var dragOffset: CGSize = .zero
    @State private var did: Bool = false
    @Binding var swpSelection: Int
    // let fingerAnimation = Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)
    // @State var animate: Bool = true
    @State private var offset: CGFloat = 100.0
    
    var body: some View {
        VStack {
            Text(titles[selectedIndex])
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 60)
            Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        Rectangle()
                            .frame(width: 400, height: 300)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .cornerRadius(38)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 0, y: 0)
                            .offset(x: dragOffset.width)
                            .padding(.horizontal, 16)
                        
                    }
                    .frame(width: 520, height: 320)
                    .edgesIgnoringSafeArea(.all)
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
                .overlay {
                    if selectedIndex == 0 {
                        Image("swipe")
                            .resizable()
                            .frame(width: 184, height: 116)
                            .offset(x: -40, y: -60)
                            .rotationEffect(.degrees(180))
                        
                        Image(systemName:"hand.point.up.fill")
                            .resizable()
                            .frame(width: 110, height: 150)
                            .foregroundColor(Color(red: 0.91, green: 0.58, blue: 0.44))
                            .offset(x: self.offset, y: 150.0 )
                            .onAppear {
                                withAnimation(.easeInOut(duration: 0.8).repeatForever()) {
                                    self.offset = 50
                                }
                            }
                    }
                }
               
            
            
            
            Spacer()
            Group {
                if selectedIndex == 2 {
                    Button {
                        swpSelection = 2
                    } label: {
                        Text("다음").font(.customNextButton())
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
            
        }
        
    }
}


struct SwipeView1_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView1(swpSelection: .constant(1))
    }
}
