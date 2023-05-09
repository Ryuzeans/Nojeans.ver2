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
        VStack(alignment: .center,spacing: 0){
            
            HStack {    
                Image(systemName: "Chevron.left")
            }
            
            Text("두번 누르기")
                .font(.system(size: 48,weight: .black))
                .padding(.bottom,97)
            
            Image("PanCircle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom,113)
            
            Text("글자 복사하기 및 붙여넣기  화면 확대하거나 축소할 때 사용해요")
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .font(.system(size: 32,weight: .light))
                .padding(.bottom,97)
            
            Button("다음") {
                nextViewAction()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide default back button
        
    }
}
