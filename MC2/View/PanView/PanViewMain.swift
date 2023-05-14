//
//  PanViewMain.swift
//  MC2
//
//  Created by YU WONGEUN on 2023/05/08.
//

import SwiftUI

struct PanViewMain: View {
    @State private var tag: Int = 0
//    @Binding var path: NavigationPath
    var body: some View {
        ZStack {
            switch tag {
                
            case 0:
                PanView0()
            case 1:
                Home(tag: $tag)
            case 2:
                PanView2(tag: $tag)
            case 3:
                PanViewFinal(tag: $tag)
            default:
                EmptyView()
            }
            
            VStack {
                
                Spacer()
                
                if tag == 0 {
                    Button {
                        tag += 1
                    } label: {
                        Text("다음").kerning(2).font(.customNextButton())
                    }
                    .btnStyle()
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PanViewMain_Previews: PreviewProvider {
    static var previews: some View {
//        PanViewMain(path: $NavigationPath)
        PanViewMain()
    }
}
