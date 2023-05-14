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
    @ObservedObject var myObservableObject = MyObservableObject()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                VStack{
                    Spacer().frame(height: 40)
                    Text("두 번 눌러볼까요?")
                        .font(Font.customTitle())

                    Image("sample")
                        .resizable()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .modifier(ImageModifier2(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height)))
                    
                    let _ = print("\(myObservableObject.buttonActive)")
                }
                Button {
                    dismiss()
                } label: {
                    Text("다음")
                        .font(.customNextButton())
                }
                .btnStyle()
                .opacity(myObservableObject.buttonActive ? 1 : 0)
                

            }.padding(16)
        }
    }
}

struct ImageModifier2: ViewModifier {
    private var contentSize: CGSize
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    @State var currentScale: CGFloat = 1.0
    @ObservedObject var myObservableObject = MyObservableObject()


    init(contentSize: CGSize) {
        self.contentSize = contentSize
    }
    
    var doubleTapGesture: some Gesture {
        TapGesture(count: 2).onEnded {
            print("----------before\(myObservableObject.buttonActive)")
            myObservableObject.buttonActive = true
            print("----------after\(myObservableObject.buttonActive)")
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
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTapView4()
    }
}


class MyObservableObject: ObservableObject {
  @Published var buttonActive = false
}

