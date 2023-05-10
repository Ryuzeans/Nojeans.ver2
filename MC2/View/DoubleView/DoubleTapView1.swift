//
//  DoubleTapView1.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//


import SwiftUI

struct DoubleTapView1: View {

    @Environment(\.dismiss) private var dismiss
    let nextViewAction: () -> Void

    var body: some View {
        ZStack {
            VStack(alignment: .center,spacing: 0){
                
                Text("두번 누르기")
                    .font(.system(size: 48,weight: .black))
                    .padding(.top, 41)
                
                Text("(Double Tap)")
                    .font(.system(size: 48,weight: .black))
                    .padding(.top,8)
                
                Image("PanCircle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 116, height: 116)
                    .padding(.top,95)
                
                Text("사진을 확대/축소할 때,\n글자를 수정할 때\n 사용해요")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(10)
                    .font(.system(size: 32,weight: .light))
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
        
        
    }
}

struct DoubleTapView1_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
