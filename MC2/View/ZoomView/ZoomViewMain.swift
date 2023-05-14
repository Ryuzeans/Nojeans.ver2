//
//  ZoomViewMain.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI

struct ZoomViewMain: View {
    @State private var tag: Int = 0
    var body: some View {
        ZStack {
            switch tag {
            case 0:
                ZoomView0(tag: $tag)
            case 1:
                ZoomView1(tag: $tag)
            case 2:
                ZoomView2(tag: $tag)
            case 3:
                ZoomViewFinal(tag: $tag)
            default:
                DragView0(tag: $tag)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

}

struct ZoomViewMain_Previews: PreviewProvider {
    static var previews: some View {
        ZoomViewMain()
    }
}
