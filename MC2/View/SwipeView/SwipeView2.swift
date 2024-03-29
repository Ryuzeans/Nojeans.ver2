//
//  SwipeView2.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct SwipeView2: View {
    @State private var index = 0
    @Binding var swpSelection: Int
    
    var text = ["왼쪽으로\n밀어볼까요?", "삭제버튼이네요?\n아래도 밀어볼까요?", "이번엔 알람 끄기\n버튼이 나왔어요!"]
    
    var body: some View {
        VStack {
            Text(text[index])
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            Spacer()
            VStack (spacing: 16){
                List {
                    HStack{
                        if index == 0 {
                            Spacer()
                            Arrows()}
                    }
                    .swipeActions {
                        Button {} label: {Image(systemName: "trash.fill") }.tint(.red)
                            .onAppear {
                                index = 1
                            }
                            .onDisappear {
                                index = 0
                            }
                    }
                    .frame(height: 80)
                    .listRowBackground((Color(red: 0.95, green: 0.95, blue: 0.95)))
                }
                .cornerRadius(20)
                .scrollDisabled(true)
                .listStyle(.plain)
                .frame(height: 100)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 0, y: 0)
                
                List {
                    HStack {
                        if index == 1 {
                            Spacer()
                            Arrows()}
                    }
                    .swipeActions {
                        Button {
                        } label: { Image(systemName: "bell.slash.fill") }.tint(.purple)
                            .onAppear {
                                index = 2
                            }
                            .onDisappear {
                                index = 0
                            }
                    }
                    .frame(height: 80)
                    .listRowBackground((Color(red: 0.95, green: 0.95, blue: 0.95)))
                }
                .cornerRadius(20)
                .scrollDisabled(true)
                .listStyle(.plain)
                .frame(height: 100)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 0, y: 0)
            }
            .padding(4)
            
            Spacer()
            
            if index != 0 {
                Button {
                    swpSelection = 3
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

struct SwipeView2_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView2(swpSelection: .constant(2))
    }
}
