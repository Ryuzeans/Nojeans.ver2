//
//  SwiftUIView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/10.
//

import SwiftUI

struct DoubleTapView4: View {
    let nextViewAction: () -> Void
    @State private var isZoomed = false
    @State private var scale: CGFloat = 1.0
    @State private var isClicked = false
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                VStack{
                    Spacer().frame(height: 40)
                    Text("빠르게 두 번 눌러\n사진을 확대해볼까요?")
                        .font(Font.customTitle()).multilineTextAlignment(.center)

                    Image("sample")
                        .resizable()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .modifier(ImageModifier2(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height),isClicked: $isClicked))
                }
                if(isClicked){
                    Button(action: {
                        nextViewAction()
                    }, label: {Text("완료").font(Font.customNextButton()).kerning(2)}).btnStyle().padding(16)
                }
            }
        }
    }
}

struct ImageModifier2: ViewModifier {
    private var contentSize: CGSize
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    @State var currentScale: CGFloat = 1.0
    @Binding var isClicked: Bool


    init(contentSize: CGSize,isClicked: Binding<Bool>) {
        self.contentSize = contentSize
        _isClicked = isClicked
    }
    
    var doubleTapGesture: some Gesture {
        TapGesture(count: 2).onEnded {
            isClicked = true
            if currentScale <= min { currentScale = max } else
            if currentScale >= max { currentScale = min } else {
                currentScale = ((max - min) * 0.5 + min) < currentScale ? max : min
            }
        }
    }
    
    func body(content: Content) -> some View {
        ScrollView([.horizontal, .vertical]) {
            content
                .frame(width: contentSize.width * currentScale, height: contentSize.height * currentScale, alignment: .center)
                .modifier(PinchToZoom(minScale: min, maxScale: max, scale: $currentScale,state: StateViewModel()))
        }
        .gesture(doubleTapGesture)
        .animation(.easeInOut, value: currentScale)
    }
}
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        DoubleTapView4()
//    }
//}


class MyObservableObject: ObservableObject {
  @Published var buttonActive = false
}

