//
//  ZoomView3.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI
import UIKit
class StateViewModel: ObservableObject{
    @Published var isPan = false
    @Published var isFold = false
}
struct ZoomView2: View {
    @Binding var tag :Int
    @StateObject var state = StateViewModel()
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                VStack{
                    Spacer().frame(height: 40)
                    if(!state.isPan){
                        Text("두 손가락을 이용해서\n확대해 볼까요?")
                            .font(Font.customTitle())
                    }
                    else{
                        Text("잘 하셨어요")
                            .font(Font.customTitle())
                    }

                    Image("sample")
                        .resizable()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height),state:state))
                }
                if(state.isPan){
                    Button(action: {
                        tag += 1
                    }, label: {Text("완료").font(Font.customNextButton()).kerning(2)}).btnStyle().padding(16)
                }
            }
        }
    }
}

struct ImageModifier: ViewModifier {
    private var contentSize: CGSize
    private var min: CGFloat = 1.0
    private var max: CGFloat = 3.0
    @State var currentScale: CGFloat = 1.0
    private var state: StateViewModel
    init(contentSize: CGSize,state: StateViewModel) {
        self.contentSize = contentSize
        self.state = state
    }
    
    var doubleTapGesture: some Gesture {
        TapGesture(count: 2).onEnded {
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
                .modifier(PinchToZoom(minScale: min, maxScale: max, scale: $currentScale,state: state))
        }
        .gesture(doubleTapGesture)
        .animation(.easeInOut, value: currentScale)
    }
}
class PinchZoomView: UIView {
    let minScale: CGFloat
    let maxScale: CGFloat
    var isPinching: Bool = false
    var scale: CGFloat = 1.0
    let scaleChange: (CGFloat) -> Void
    private var state:StateViewModel
    init(minScale: CGFloat,
           maxScale: CGFloat,
         currentScale: CGFloat,
         state: StateViewModel,
         scaleChange: @escaping (CGFloat) -> Void) {
        self.minScale = minScale
        self.maxScale = maxScale
        self.scale = currentScale
        self.scaleChange = scaleChange
        self.state = state
        super.init(frame: .zero)
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        pinchGesture.cancelsTouchesInView = false
        addGestureRecognizer(pinchGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func pinch(gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .began:
            isPinching = true
            
        case .changed, .ended:
            if gesture.scale <= minScale {
                scale = minScale
                if(state.isPan){
                    state.isFold = true;
                }
            } else if gesture.scale >= maxScale {
                scale = maxScale
                state.isPan = true;
                print(state.isPan)
            } else {
                scale = gesture.scale
            }
            scaleChange(scale)
        case .cancelled, .failed:
            isPinching = false
            scale = 1.0
        default:
            break
        }
    }
}

struct PinchZoom: UIViewRepresentable {
    let minScale: CGFloat
    let maxScale: CGFloat
    @Binding var scale: CGFloat
    @Binding var isPinching: Bool
    var state: StateViewModel
    
    func makeUIView(context: Context) -> PinchZoomView {
        let pinchZoomView = PinchZoomView(minScale: minScale, maxScale: maxScale, currentScale: scale, state: state, scaleChange: { scale = $0 })
        return pinchZoomView
    }
    
    func updateUIView(_ pageControl: PinchZoomView, context: Context) { }
}

struct PinchToZoom: ViewModifier {
    let minScale: CGFloat
    let maxScale: CGFloat
    @Binding var scale: CGFloat
    @State var anchor: UnitPoint = .center
    @State var isPinching: Bool = false
    var state: StateViewModel
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: anchor)
            .animation(.spring(), value: isPinching)
            .overlay(PinchZoom(minScale: minScale, maxScale: maxScale, scale: $scale, isPinching: $isPinching,state: state))
    }
}
//struct ZoomView2_Previews: PreviewProvider {
//    static var previews: some View {
//        ZoomView2()
//    }
//}
