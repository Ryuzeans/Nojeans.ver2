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
    
    var body: some View {
        VStack {
            Text(titles[selectedIndex])
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 80)
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 32) {
                    Rectangle()
                        .frame(width: 520, height: 300)
                        .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(38)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                        .offset(x: dragOffset.width)
                        .padding(.horizontal, 48)
                }.frame(width: 720, height: 320).edgesIgnoringSafeArea(.all)
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
                        Text("다음")
                            .font(.customNextButton())
                    }
                    .btnStyle().padding(.horizontal, 16)
                    .offset(y: 52)
                    .frame(height: 50)
                }
                
                else {
                    Button {
                    } label: {
                        Text("")
                    }
                    .offset(y: 52)
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
