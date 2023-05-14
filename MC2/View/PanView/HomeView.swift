//
//  HomeView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/14.
//

import SwiftUI

struct Home: View {
    
    // Offset Value...
    // SInce were going to fetch offset for both vertical and horizontal so were using CGPoint....
    @State var offset: CGPoint = .zero
    @State private var buttonActive: Bool = false
    @Binding var tag :Int
    @State private var offset1: CGFloat = 50
    
    var body: some View{
        
        let _ = print("Offset x: \(String(format: "%.1f", offset.x))")
        let _ = print("Offset y: \(String(format: "%.1f", offset.y))")
            
        ZStack {
            CustomScrollView(offset: $offset, showIndicators: true, axis: .vertical, content: {
                    
                    // Your General SCroll View COntent....
                    VStack(spacing: 15){
                        
                        Image("PanMapOn")
                            .resizable()
                            .scaleEffect(0.7)
                    }
                
                
            })
            VStack{
                Spacer().frame(height: 40)
                
                Text(offset.x <= -220.0 && offset.y <= 0.0 ? "잘하셨어요!" : "돋보기를 찾아볼까요?")
                    .font(Font.customTitle())

                Spacer()
                

                
                Spacer()
                if(offset.x <= -200.0 && offset.y <= -0.0){
                    Button(action: {
                        tag += 1
                    }, label: {
                        Text("다음").font(.customNextButton()).kerning(2)
                    })
                    .btnStyle()
                        .padding(16)
                    
                }
                
            }
            
            
        }

    }
    
}

// Building Custom ScrollView Using View Builder....

struct CustomScrollView<Content: View>: View {
    
    // to Hold Our View....
    // Or to capture the described view...
    var content: Content
    
    @Binding var offset: CGPoint
    var showIndicators: Bool
    var axis: Axis.Set
    
    // since it will carry multiple views....
    // so it will be a closure and it will return View...
    init(offset: Binding<CGPoint>,showIndicators: Bool,axis: Axis.Set,@ViewBuilder content: ()->Content) {
        
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
    }
    
    // Getting Exact Start Offset And Minu from current Offset...
    // So that crt offset will be obtained...
    @State var startOffset: CGPoint = .zero
    
    var body: some View{
        
        ScrollView([.horizontal, .vertical], showsIndicators: false, content: {
            
            content
            // Getting Offset....
                .overlay(
                
                    // Using Geomtry Reader to get offset...
                    
                    GeometryReader{proxy -> Color in
                    
                        let rect = proxy.frame(in: .global)
                        
                        if startOffset == .zero{
                            DispatchQueue.main.async {
                                startOffset = CGPoint(x: rect.minX, y: rect.minY)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            
                            // Minus From Current...
                            self.offset = CGPoint(x: startOffset.x - rect.minX, y: startOffset.y - rect.minY)
                        }
                        
                        return Color.clear
                    }
                    // Since were also fetching horizontal offset...
                    // so setting width to full so that minX will be Zero...
                    .frame(width: UIScreen.main.bounds.width, height: 0)
                    
                    ,alignment: .top
                )
        })
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
