//
//  LongPressMainView.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct LongPressMain: View {
    @State private var selection = 0
    var body: some View {
        ZStack {
            switch selection {
            case 0:
                LongPressSubscriptionView(selection: $selection)
            case 1:
                LongPressView1(selection: $selection)
            case 2:
                LongPressView2(selection: $selection)
            default:
                LongPressSubscriptionView(selection: $selection)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LongPressSubscriptionView: View {
    @Binding var selection: Int
    
    var body: some View{
        VStack {
            Text("길게 누르기").font(.customTitle()).padding(.top, 60)
            Text("Long Tap").font(.customEngTitle()).foregroundColor(Color(red: 0.776, green: 0.776, blue: 0.784))
            Spacer()
            Image("TouchBall")
                .resizable()
                .frame(width: 116, height: 116)
            Spacer()
            HStack {
                Text("아이콘에서\n추가적인 기능이나\n조작을 할 때 사용해요").font(.customExplain()).padding(.horizontal,16)
                Spacer()
            }
            Button {
                selection = 1
            } label: {
                Text("다음").font(.customNextButton())
            }.btnStyle()
        }.padding(16)
    }
}
