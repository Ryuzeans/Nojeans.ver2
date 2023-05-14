//
//  DragViewMain.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct DragViewMain: View {
    @State private var tag: Int = 0
    var body: some View {
        ZStack {
            switch tag {
            case 0:
                DragView0(tag: $tag)
            case 1:
                DragView1(tag: $tag)
            case 2:
                DragView2(tag: $tag)
            case 3:
                DragView3(tag: $tag)
            case 4:
                DragViewFinal(tag: $tag)
            default:
                DragView0(tag: $tag)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DragViewMain_Previews: PreviewProvider {
    static var previews: some View {
        DragViewMain()
    }
}
