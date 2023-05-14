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
            case 3:
                LongPressFinalView(selection: $selection)
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
            Text("길게 누르기").font(.customTitle()).padding(.top, 40)
            Text("Long Tap").font(.customEngTitle()).foregroundColor(Color("SubTitleColor"))
            Spacer()
            
            Image("TouchBall")
                .resizable()
                .frame(width: 116, height: 116)
            Spacer()
            
            HStack {
                Text("아이콘의 추가 기능과 미리보기 기능을\n")
                    .font(.customExplainEmphasis()) +
                Text("볼 때 사용돼요")
                    .font(Font.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal,16)
            
            Button {
                selection = 1
            } label: {
                Text("다음").font(.customNextButton()).kerning(2)
            }.btnStyle()
        }.padding(16)
    }
}
