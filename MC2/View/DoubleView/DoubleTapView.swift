//
//  DoubleTabView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/08.
//

import SwiftUI

struct DoubleTapView: View {
    enum ViewState {
        case first
        case second
        case third
    }
    
    @State private var viewState: ViewState = .first
    
    var body: some View {
        VStack {
            switch viewState {
            case .first:
                DoubleTapView1(nextViewAction: {
                    viewState = .second
                })
            case .second:
                DoubleTapView2(nextViewAction: {
                    viewState = .third
                })
            case .third:
                DoubleTapView3()
            }
        }
    }
}



struct DoubleTapView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView()
    }
}
