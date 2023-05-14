//
//  DoubleTabViewFinal.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/15.
//

import SwiftUI

struct DoubleTapViewFinal: View {
    @Environment(\.dismiss) private var dismiss
    let nextViewAction: () -> Void

    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            Image("Logo")
            Spacer()
            Image("TouchBall").resizable().frame(width: 100, height: 100)
            Spacer()
            Text("두 번 누르기 학습을\n완료했습니다!").font(.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                nextViewAction()
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
