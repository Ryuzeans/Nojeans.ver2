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
            Text("아래 카메라를\n 3초간\n눌러 볼까요?")
                .font(.customTitle())
                .multilineTextAlignment(.center)
                .padding(.top, 80)
              
            Image("Camera")
                .padding()
                .contextMenu {
                    Button {} label: {Label("셀피 찍기", systemImage: "person.crop.square")}
                    Button {} label: {Label("비디오 녹화", systemImage: "video")}
                    Button {} label: {Label("인물 사진 찍기", systemImage: "person.and.background.dotted")}
                    Button {} label: {Label("인물 사진 셀피 찍기", systemImage: "person.and.background.dotted")}
                    Divider()
                    Button {} label: {Label("홈 화면 편집", systemImage: "apps.iphone")}
                    Button(role: .destructive) {} label: {Label("앱 제거", systemImage: "minus.circle")}
                }
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .updating($isUpdating, body: {currentState, gestureState, transaction in
                            gestureState = currentState
                        })
                        .onEnded{ value in
                            buttonActive = true
                        }
                )
            
            if buttonActive {
                Button {
                    //TODO: 다음 뷰 이동
                } label: {
                    Text("다음").foregroundColor(.white)
                }.btnStyle().padding()
            } else {
                Button { } label: {
                    Text("").foregroundColor(.white)
                }.padding()
            }
        }.edgesIgnoringSafeArea(.all)
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
