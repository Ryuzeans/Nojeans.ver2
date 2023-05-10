//
//  SwipeView3.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct Message: Identifiable, Equatable, Hashable {
    var id = UUID()
    var imageName: String
    var phNumber: String
    var text: String
    var time: String
}

var messageData =  [
    Message(imageName: "person.circle.fill", phNumber: "+82-1234-5678", text: "[Web]\n손오공, 별천지...", time: "오후 4:20"),
    Message(imageName: "person.circle.fill", phNumber: "+1-1353-8843", text: "[WEB 발신] 회신 주세요...\n", time: "어제"),
    Message(imageName: "person.circle.fill", phNumber: "+010-9471-8933", text: "안녕하세요...\n", time: "금요일")
]

struct SwipeView3: View {
    @State var btnActive = false
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Text("메시지를 밀고\n휴지통을 눌러\n삭제해 보세요")
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
            
            List() {
                ForEach(messageData, id: \.id) { message in
               
                    HStack {
                        Image(systemName: message.imageName)
                            .font(.system(size: 44))
                        VStack(alignment: .leading) {
                            HStack {
                                Text(message.phNumber)
                                    .bold()
                                Spacer()
                                Text(message.time)
                                Image(systemName: "chevron.right")
                            }
                            Text(message.text)
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive , action: {
                            btnActive = true
                        }) {
                            Image(systemName: "trash.fill")
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            //btnActive = true
                        } label: {
                            Image(systemName: "bell.slash.fill")
                        }
                        .tint(Color.purple)
                    }
                }
            }
            .listStyle(.plain)
            .frame(maxHeight: 320)
            
            if btnActive {
                Button {
                    //selection = 0
                    //TODO: FanView로 수정
                } label: {
                    if btnActive {
                        Text("다음")
                            .font(.customNextButton())
                            .foregroundColor(Color.white)
                    }
                }.btnStyle()
            }
            
            else {
                Button {
                    
                } label: {
                    Text("").font(.customNextButton())
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func deleteMessage(at offsets: IndexSet) {
        messageData.remove(atOffsets: offsets)
    }
}

struct SwipeView3_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView3(selection: .constant(3))
    }
}
