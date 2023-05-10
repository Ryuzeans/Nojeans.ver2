//
//  LongPressMain.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct LongPressMain: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            LongPressSubscriptionView(selection: $selection).tag(0)
            LongPressView1(selection: $selection).tag(1)
            LongPressView2(selection: $selection).tag(2)
        }
    }
}

struct LongPressSubscriptionView: View {
    @Binding var selection: Int
    var body: some View{
        VStack {
            Text("길게 누르기").font(.customTitle()).padding(.top, 80)
            Text("Long Tap").font(.customEngTitle()).foregroundColor(Color(red: 0.776, green: 0.776, blue: 0.784))
            Spacer()
            Image("PanCircle")
                .resizable()
                .frame(width: 80, height: 80)
            Spacer()
            Text("아이콘에서\n추가적인 기능이나\n조작을 할 때 사용해요").font(.customExplain())

            Button {
                selection = 1
            } label: {
                Text("다음")
            }.btnStyle()
        }
    }
}
