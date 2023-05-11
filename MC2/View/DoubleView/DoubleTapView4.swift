//
//  SwiftUIView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/10.
//

import SwiftUI

struct DoubleTapView4: View {
    
        @State private var isZoomed = false
        @State private var scale: CGFloat = 1.0
        @Environment(\.dismiss) private var dismiss

        var body: some View {
            ZStack {
                Image("sample")
//                    .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    TapGesture(count: 2)
                        .onEnded{ _ in
                            withAnimation(.linear) {
                                if isZoomed {
                                    scale -= 1.5
                                } else {
                                    scale += 1.5
                                }
                                isZoomed.toggle()
                            }
                    })
                VStack(spacing: 0) {
                    
                    Text("두번 눌러볼까요?")
                        .font(.customTitle())
                        .frame(height: 132)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .padding(.bottom,500)
                    
                    Button("다음") {
                        dismiss()
                    }
                }
            }  
        }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        DoubleTapView4()
//    }
//}
struct ImageModifier2: ViewModifier {
    private var contentSize: CGSize
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    @State var currentScale: CGFloat = 1.0
    @State var buttonActive: Bool = false

    init(contentSize: CGSize) {
        self.contentSize = contentSize
    }
    
    var doubleTapGesture: some Gesture {
        TapGesture(count: 2).onEnded {
            buttonActive = true
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
                .modifier(PinchToZoom(minScale: min, maxScale: max, scale: $currentScale))
        }
        .gesture(doubleTapGesture)
        .animation(.easeInOut, value: currentScale)
    }
}
