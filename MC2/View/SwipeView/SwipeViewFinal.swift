//
//  SwipeViewFinal.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/15.
//

import SwiftUI

struct SwipeViewFinal: View {
    @Binding var swpSelection: Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            Image("Logo")
            Spacer()
            Image("swipe").resizable().frame(width: 158, height: 100)
            Spacer()
            Text("살짝 쓸기 학습을\n완료했습니다!").font(.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                swpSelection = 0
            } label: {
                Text("다시하기").font(.customNextButton()).kerning(2)
            }.btnWhiteStyle()
                .frame(height: 50)
            Button {
                dismiss()
            } label: {
                Text("처음으로").font(.customNextButton()).kerning(2)
            }.btnStyle()
                .frame(height: 50)
        }.padding(16)
    }
}
