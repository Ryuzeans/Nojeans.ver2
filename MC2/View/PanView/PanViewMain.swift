//
//  PanViewMain.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/08.
//

import SwiftUI

struct PanViewMain: View {
    @State private var tag: Int = 0
    var body: some View {
        ZStack {
            switch tag {
                
            case 0:
                PanView0()
            case 1:
                PanView1(tag: $tag)
            case 2:
                PanView2(tag: $tag)
            default:
                MainView()
            }
            
            VStack {
                
                Spacer()
                
                if tag == 0 {
                    Button {
                        tag += 1
                    } label: {
                        Text("다음")
                    }
                    .btnStyle()
                    .padding(.horizontal,16)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PanViewMain_Previews: PreviewProvider {
    static var previews: some View {
        PanViewMain()
    }
}
