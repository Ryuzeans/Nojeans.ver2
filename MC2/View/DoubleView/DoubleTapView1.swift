//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//


import SwiftUI

struct DoubleTapView1: View {

    let nextViewAction: () -> Void

    var body: some View {
        ZStack {
            VStack(alignment: .center,spacing: 0){
                
                Text("두번 누르기")
                    .font(.customTitle())
                    .padding(.top, 41)
                
                Text("(Double Tap)")
                    .foregroundColor(Color("SubTitleColor"))
                    .font(.customEngTitle())
                    .font(.system(size: 48,weight: .black))
                    .padding(.top,8)
                
                Image("DoubleCircle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 116, height: 116)
                    .padding(.top,95)
                
                Text("사진을 확대/축소할 때,\n글자를 수정할 때\n사용해요")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(10)
                    .font(.customExplain())
                    .padding(.top,104)
                    .padding(.bottom,32)
                
                Spacer()
            }
            VStack(){
                Spacer()
                Button("다음") {
                    nextViewAction()
                }
                .btnStyle()

                
            }
        }
        .padding(.horizontal,16)
        
        
    }
}

struct DoubleTapView1_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
