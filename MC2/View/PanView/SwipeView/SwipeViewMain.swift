//
//  SwipeViewMain.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct SwipeViewMain: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            SwipeSubscriptionView(selection: $selection).tag(0)
            SwipeView1(selection: $selection).tag(1)
            SwipeView2(selection: $selection).tag(2)
            SwipeView3(selection: $selection).tag(3)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SwipeSubscriptionView: View {
    @Binding var selection: Int
    var body: some View{
        VStack {
            Text("살짝 쓸기").font(.customTitle()).padding(.top, 80)
            Text("Swipe").font(.customEngTitle()).foregroundColor(Color(red: 0.776, green: 0.776, blue: 0.784))
            Spacer()
            Image("PanCircle")
                .resizable()
                .frame(width: 80, height: 80)
            Spacer()
            Text("현재 보이지 않는 화면을\n찾을 때 주로 사용해요").font(.customExplain())

            Button {
                selection = 1
            } label: {
                Text("다음")
            }.btnStyle()
        }
    }
}
