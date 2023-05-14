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
            case 4:
                SwipeViewFinal(swpSelection: $swpSelection)
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
            Text("살짝 쓸기").font(.customTitle()).padding(.top, 40)
            Text("Swipe").font(.customEngTitle()).foregroundColor(Color("SubTitleColor"))
            Spacer()
                                                                  
            Image("swipe")
                .resizable()
                .frame(width: 184, height: 116)
            Spacer()
                                                                  
            HStack {
                Text("현재 ")
                    .font(.customExplain()) +
                Text("보이지 않는 화면을\n")
                    .font(.customExplainEmphasis()) +
                Text("찾을 때 ")
                    .font(.customExplainEmphasis()) +
                Text("주로 사용해요")
                    .font(.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal, 16)
            
            Button {
                swpSelection = 1
            } label: {
                Text("다음").font(.customNextButton()).kerning(2)
            }.btnStyle()
        }.padding(16)
    }
}
