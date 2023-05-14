//
//  LongPressFinalView.swift
//  MC2
//
//  Created by Lee Jinhee on 2023/05/14.
//

import SwiftUI

struct LongPressFinalView: View {
    @Binding var selection: Int
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer().frame(height: 60)
            Image("Logo")
            Spacer()
            Image("TouchBall").resizable().frame(width: 100, height: 100)
            Spacer()
            Text("길게 누르기 학습을\n완료했습니다!").font(.customTitle())
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                selection = 0
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

struct LongPressFinalView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressFinalView(selection: .constant(3))
    }
}
