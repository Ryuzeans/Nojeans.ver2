//
//  DragViewFinal.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/15.
//

import SwiftUI

struct DragViewFinal: View {
    @Binding var tag :Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            Image("Logo")
            Spacer()
            Image("drag_seq").resizable().frame(width: 100, height: 134)
            Spacer()
            Text("끌어 오기 학습을\n완료했습니다!").font(.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                tag = 0
            } label: {
                Text("다시하기").font(.customNextButton()).kerning(2)
            }.btnWhiteStyle()
                .frame(height: 50)
                .padding(.bottom,8)
            Button {
                dismiss()
            } label: {
                Text("처음으로").font(.customNextButton()).kerning(2)
            }.btnStyle()
                .frame(height: 50)
        }.padding(16)
    }
}
