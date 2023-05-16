//
//  LongPressView2.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct LongPressView2: View {
    @State private var isShowingContextMenu = false
    @GestureState var  isUpdating = false
    @State var buttonActive: Bool = false
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            Text(!buttonActive ? "카메라를 1초 동안\n눌러서 추가 기능을\n알아볼까요?" : "잘하셨어요!\n다음 버튼을 눌러 주세요!")
                .font(.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            VStack {
                Image("Camera")
                    .resizable()
                    .frame(width: 128, height: 128)
                    .scaledToFill()
            }
            .frame(width: 128, height: 128)
            .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 28.0))
            
            .contextMenu {
                Button {} label: {Label("셀피 찍기", systemImage: "person.crop.square")}
                Button {} label: {Label("비디오 녹화", systemImage: "video")}
                Button {} label: {Label("인물 사진 찍기", systemImage: "person.and.background.dotted")}
                Button {} label: {Label("인물 사진 셀피 찍기", systemImage: "person.and.background.dotted")}
                Divider()
                Button {} label: {Label("홈 화면 편집", systemImage: "apps.iphone")}
                Button(role: .destructive) {} label: {Label("앱 제거", systemImage: "minus.circle")}
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.easeOut) {
                                buttonActive = true
                            }
                        }
                    }
            }
            Spacer()
            if buttonActive {
                Button {
                    selection = 3
                } label: {
                    Text("완료").font(.customNextButton()).kerning(2)
                }.btnStyle().frame(height: 50)
            } else {
                Button { } label: {
                    Text("")
                }.frame(height: 50)
            }
        }.padding(16)
    }
}

struct Landmark:Identifiable{
    var id = UUID()
    var title:String
    var imageName:String
    var color: Color
}

var landmarksData =  [
    Landmark(title: "셀피 찍기", imageName: "person.crop.square", color: .black),
    Landmark(title: "비디오 녹화", imageName: "video", color: .black),
    Landmark(title: "인물 사진 찍기", imageName: "person.and.background.dotted", color: .black),
    Landmark(title: "인물 사진 셀피 찍기", imageName: "person.and.background.dotted", color: .black),
    Landmark(title: "홈 화면 편집", imageName: "apps.iphone", color: .black),
    Landmark(title: "앱 제거", imageName: "minus.circle", color: .red)
]
