//
//  PanView0.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/07.
//

import SwiftUI

struct PanView0: View {
    @State private var position: CGSize = .zero
    var body: some View {
        
        let drag = DragGesture(minimumDistance: 0)
            .onChanged { gesture in
                self.position = gesture.translation
            }
            .onEnded { gesture in
                self.position = .zero
            }
        
        VStack {
            Spacer().frame(height: 40)
            Text("화면 움직이기")
                .font(.customTitle())
            Text("Pan")
                .font(Font.customEngTitle())
                .foregroundColor(Color("SubTitleColor"))
            Spacer()
            
            ZStack {
                Image("PanArrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
                Image("TouchBall")
                    .resizable()
                    .frame(width: 116, height: 116)
                    .offset(x: position.width, y: position.height)
                    .gesture(drag)
            }
            Spacer()
            
            HStack {
                Text("현재 ")
                    .font(.customExplain()) +
                Text("화면을 상하좌우로\n")
                    .font(.customExplainEmphasis()) +
                Text("움직일 때 ")
                    .font(.customExplainEmphasis()) +
                Text("사용해요")
                    .font(.customExplain())
                Spacer()
            }
            .lineSpacing(10)
            .padding(.horizontal,16)
            
            Spacer().frame(height: 70)
        }.padding(16)
    }
}

struct PanView0_Previews: PreviewProvider {
    static var previews: some View {
        PanView0()
    }
}
