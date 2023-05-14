//
//  PanViewFinal.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/15.
//

import SwiftUI

struct PanViewFinal: View {
    @Binding var tag :Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            Image("Logo")
            Spacer()
            Image("pan").resizable().frame(width: 160, height: 160)
            Spacer()
            Text("화면 움직이기 학습을\n완료했습니다!").font(.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                tag = 0
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
