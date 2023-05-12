//
//  SwipeViewMain.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/10.
//

import SwiftUI

struct SwipeViewMain: View {
    @State private var swpSelection = 0
    var body: some View {
        ZStack {
            switch swpSelection {
            case 0:
                SwipeSubscriptionView(swpSelection: $swpSelection)
            case 1:
                SwipeView1(swpSelection: $swpSelection)
            case 2:
                SwipeView2(swpSelection: $swpSelection)
            case 3:
                SwipeView3(swpSelection: $swpSelection)
            default:
                SwipeSubscriptionView(swpSelection: $swpSelection)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}




struct SwipeSubscriptionView: View {
    @Binding var swpSelection: Int
    var body: some View{
        VStack {
            Text("살짝 쓸기").font(.customTitle()).padding(.top, 60)
            Text("Swipe").font(.customEngTitle()).foregroundColor(Color(red: 0.776, green: 0.776, blue: 0.784))
            Spacer()
            Image("swipe")
                .resizable()
                .frame(width: 184, height: 116)
            Spacer()
            HStack {
                Text("현재 보이지 않는 화면을\n찾을 때 주로 사용해요").font(.customExplain()).padding(.horizontal, 16)
                Spacer()
            }
            Button {
                swpSelection = 1
            } label: {
                Text("다음").font(.customNextButton())
            }.btnStyle()
        }.padding(16)
    }
}
