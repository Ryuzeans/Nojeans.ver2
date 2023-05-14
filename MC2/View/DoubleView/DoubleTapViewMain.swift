//
//  DoubleTabView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapViewMain: View {
    enum ViewState {
        case first
        case second
        case third
        case four
        case five
    }
    
    @State private var viewState: ViewState = .first
    @State private var buttonActive: Bool = false
    
    var body: some View {
        VStack {
            switch viewState {
            case .first:
                DoubleTapView1(nextViewAction: {
                    viewState = .second
                })
            case .second:
//                EmptyView()
                DoubleTapView2(nextViewAction: {
                    viewState = .third
                    
                })
            case .third:
                DoubleTapView3(nextViewAction: {
                    viewState = .four
                })
            case .four:
                DoubleTapView4(nextViewAction: {
                    viewState = .five
                })
            case .five:
                DoubleTapViewFinal(nextViewAction: {
                    viewState = .first
                })
            }
            
        }
        .navigationBarBackButtonHidden(true)
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                Text("두 번 누르기")
//            }
//        }
    }
}



struct DoubleTapView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
