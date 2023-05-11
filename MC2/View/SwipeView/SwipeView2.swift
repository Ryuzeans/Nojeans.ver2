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
                .padding(.top, 80)
            Spacer()
            VStack (spacing: 20){
                List {
                    HStack{}
                        .frame(height: 80)
                        .swipeActions {
                            Button {} label: {Image(systemName: "trash.fill") }.tint(.red)
                                .onAppear {
                                    index = 1
                                }
                                .onDisappear {
                                    index = 0
                                }
                        }
                        .cornerRadius(24)
                        .listRowBackground((Color(red: 0.85, green: 0.85, blue: 0.85)))
                }
                .scrollDisabled(true)
                .listStyle(.plain)
                .frame(height: 120)
                
                List {
                    HStack {}
                        .frame(height: 80)
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
                        .listRowBackground((Color(red: 0.85, green: 0.85, blue: 0.85)))
                }
                .scrollDisabled(true)
                .listStyle(.plain)
                .frame(height: 120)
            }
            .padding()
            
            Spacer()

            
            if index != 0 {
                Button {
                    swpSelection = 3
                } label: {
                    Text("다음").font(.customNextButton())
                }.offset(y: 52).btnStyle().frame(height: 50)
            }
            else {
                Button { } label: {
                    Text("")
                }.offset(y: 52).frame(height: 50)
            }
        }.padding(16)
    }
}

struct SwipeView2_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView2(swpSelection: .constant(2))
    }
}
