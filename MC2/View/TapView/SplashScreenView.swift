//
//  SplashScreenView.swift
//  Toucher
//
//  Created by 하명관 on 2023/05/15.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isFinished = false // 스플래쉬 화면 끝날때 다른 화면으로 넘어가기
    
    var body: some View {
        
        if !isFinished {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            }.onAppear { //View 가 나타날 때  실행될 acttion을 추가 특정항목을 나타낼수가있음.
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { //0.6초 지연
                    withAnimation {
                        isFinished.toggle()
                    }
                }
                            
        }
                
        }

            
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
