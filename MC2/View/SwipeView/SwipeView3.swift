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

struct SwipeView3: View {
    @State var btnActive = false
    @Binding var swpSelection: Int
    
    @State var messageData =  [
        Message(imageName: "person.circle.fill", phNumber: "+82-1234-5678", text: "[Web]\n손오공, 별천지...", time: "오후 4:20"),
        Message(imageName: "person.circle.fill", phNumber: "+1-1353-8843", text: "[WEB 발신] 회신 주세요...\n", time: "어제"),
        Message(imageName: "person.circle.fill", phNumber: "+010-9471-8933", text: "안녕하세요...\n", time: "금요일")
    ]
    
    var body: some View {
        VStack {
            Text(messageData.count == 0 ? "잘하셨어요!\n다음 버튼을\n눌러주세요!" : "메시지를 밀어서\n삭제해 보세요\n")
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            Spacer()
            List() {
                ForEach(messageData, id: \.id) { message in
                    HStack {
                        Image(systemName: message.imageName)
                            .font(.system(size: 44))
                        VStack(alignment: .leading) {
                            HStack {
                                Text(message.phNumber).bold()
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
                            self.deleteMessage(message)
                        }) {
                            Image(systemName: "trash.fill")
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                        } label: {
                            Image(systemName: "bell.slash.fill")
                        }
                        .tint(Color.purple)
                    }
                }
            }
            .listStyle(.plain)
            .frame(maxHeight: 320)
            
            Spacer()

            if btnActive {
                Button {
                    swpSelection = 4
                } label: {
                        Text("완료").font(.customNextButton()).kerning(2)
                }.btnStyle().frame(height: 50)
            }
            else {
                Button { } label: {
                    Text("")
                }.frame(height: 50)
            }
        }.padding(16)
    }

    func deleteMessage(_ message: Message) {
        messageData.removeAll(where: { $0 == message })
    }
}

struct SwipeView3_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView3(swpSelection: .constant(3))
    }
}
