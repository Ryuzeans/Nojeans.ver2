//
//  DoubleTapView1.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/02.
//

import SwiftUI

struct DoubleTapView1: View {
    var body: some View {
        GeometryReader { geo in
            
            
            VStack(alignment: .leading ,spacing: geo.size.width / 7){
                
                Text("두번 누르기")
                    .font(.system(size: geo.size.width / 11).weight(.bold))
                
                
                Text("이전에 배웠던 누르기와 다른점이 무엇일까요?")
                    .font(.system(size: geo.size.width / 15).weight(.semibold))
                    .multilineTextAlignment(.leading)
                
                Text("탭은 1번 눌렀지만 더블 탭은 화면을 2번 눌러야 합니다.")
                    .font(.system(size: geo.size.width / 18).weight(.light))
                    .multilineTextAlignment(.leading)
                
                Text("어디에 사용될까요?")
                    .font(.system(size: geo.size.width / 15).weight(.semibold))
                    .multilineTextAlignment(.leading)
                
                Text("표준적으로 Zoom in(확대)와 Zoom out(축소)에 사용됩니다.")
                    .font(.system(size: geo.size.width / 18).weight(.light))
                    .multilineTextAlignment(.leading)
                
                
                Button {
                    // 실행할 코드
                } label: {
                    
                    Text("직접 배워보러 가요!")
                        .font(.system(size: geo.size.width / 20).weight(.bold))
                        .foregroundColor(.black)
                        .frame(width: geo.size.width / 1.45, height: geo.size.height / 15)
                        
                }
                .buttonStyle(.bordered)
                
            }
            .padding(geo.size.width / 8)
            
        }
    }
}

struct DoubleTapView1_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView1()
    }
}
