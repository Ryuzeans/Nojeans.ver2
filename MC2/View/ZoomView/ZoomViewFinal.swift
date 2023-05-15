//
//  ZoomViewFinal.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/15.
//

import SwiftUI

struct ZoomViewFinal: View {
    @Binding var tag :Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            Image("Logo")
            Spacer()
            Image("zoomView_circle").resizable().frame(width: 158, height: 158)
            Spacer()
            Text("확대 축소하기 학습을\n완료했습니다!").font(.customTitle())
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
