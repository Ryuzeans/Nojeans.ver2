//
//  RotationView0.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct RotationView0: View {
    @State private var rotation = 0.0
    @Binding var tag :Int
    var body: some View {
        VStack {
            Text("회전하기")
                .font(Font.customTitle())
                .padding(.top, 40)
            Text("Rotate")
                .font(Font.customEngTitle())
                .foregroundColor(Color("SubTitleColor"))
            Spacer()
            
            Image("RotateExp")
//                .resizable()
//                .frame(width: 344, height: 206)
            //                .rotationEffect(Angle.degrees(rotation))
            //                .onAppear {
            //                    withAnimation(.easeOut(duration: 3.0)) {
            //                        rotation += 360.0
            //                    }
            //                }
            Spacer()
            
            HStack {
                Text("화면의 ")
                    .font(.customExplain()) +
                Text("물체를 뒤집어\n보고 싶을 때 ")
                    .font(.customExplainEmphasis()) +
                Text("사용해요")
                    .font(Font.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal,16)
        
            Button {
                tag += 1
            } label: {
                Text("다음").kerning(2).font(.customNextButton())
            }
            .btnStyle()
        }.padding(16)
    }
}

        //        GeometryReader { geo in
        //
        //
        //            VStack(alignment: .leading ,spacing: geo.size.width / 7) {
        //
        //                Text("회전")
        //                    .font(.system(size: geo.size.width / 11).weight(.bold))
        //
        //
        //                Text("로테이션은 회전의 의미를 갖고 있어요 !")
        //                    .font(.system(size: geo.size.width / 15).weight(.semibold))
        //                    .multilineTextAlignment(.leading)
        //
        //                Text("화면을 회전한다고 생각하면 \n될 것 같아요 !")
        //                    .font(.system(size: geo.size.width / 18).weight(.light))
        //                    .multilineTextAlignment(.leading)
        //
        //                Text("어디에 사용될까요?")
        //                    .font(.system(size: geo.size.width / 15).weight(.semibold))
        //                    .multilineTextAlignment(.leading)
        //
        //                Text("선택된 어떤 것(사진, 화면 등)을 회전시키기 위해서 사용됩니다.")
        //                    .font(.system(size: geo.size.width / 18).weight(.light))
        //                    .multilineTextAlignment(.leading)
        //
        //
        //                Button {
        //                    // 실행할 코드
        //                } label: {
        //
        //                    Text("직접 배워보러 가요!")
        //                        .font(.system(size: geo.size.width / 20).weight(.bold))
        //                        .foregroundColor(.black)
        //                        .frame(width: geo.size.width / 1.45, height: geo.size.height / 15)
        //
        //                }
        //                .buttonStyle(.bordered)
        //
        //            }
        //            .padding(geo.size.width / 8)
        //
        //        }
