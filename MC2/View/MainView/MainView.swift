//
//  MainView.swift
//  MC2
//
//  Created by 하명관 on 2023/05/07.
//

import SwiftUI

struct TouchGesture: Identifiable,Hashable{
    let id = UUID()
    let name: String
    var image: String
    let subName: String
}

struct MainView: View {
    
    let brands: [TouchGesture] = [
<<<<<<< Updated upstream
        .init(name: "두 번 누르기", image: "ListColor 6", subName: "Double Tap"),
        .init(name: "길게 누르기", image: "ListColor 5", subName: "Long Tap"),
        .init(name: "살짝 쓸기", image: "ListColor 2", subName: "Swipe"),
        .init(name: "끌어오기", image: "ListColor 4", subName: "Drag"),
        .init(name: "화면 움직이기", image: "ListColor 3", subName: "Pan"),
        .init(name: "확대, 축소하기", image: "ListColor 1", subName: "Zoom in, out"),
        .init(name: "회전하기", image: "ListColor", subName: "Rotate"),
=======
        .init(name: "두 번 누르기", image: "Image1", subName: "Double Tap"),
        .init(name: "길게 누르기", image: "Image2", subName: "Long Tap"),
        .init(name: "살짝 쓸기", image: "Image3", subName: "Swipe"),
        .init(name: "끌어오기", image: "Image4", subName: "Drag"),
        .init(name: "화면 움직이기", image: "Image5", subName: "Pan"),
        .init(name: "확대, 축소하기", image: "Image6", subName: "Zoom in, out"),
        .init(name: "회전하기", image: "Image1", subName: "Rotate"),
>>>>>>> Stashed changes
    ]
    
    @State private var navigationPath = [TouchGesture]()
    
    @State private var showFullStack = false
    
    
    
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack(alignment: .leading,spacing: 0) {
                    ScrollView(showsIndicators: false){
                        ForEach(brands) { brand in
                            NavigationLink(value: brand) {
                                
                                Rectangle()
                                    .foregroundColor(Color("\(brand.image)"))
                                    .frame(height: 115)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                                    .shadow(radius: 4,x:2,y:2)
                                    .overlay(
                                        VStack {
                                            
                                            Text(brand.name)
                                                .font(.customTitle())
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                            
                                            Text(brand.subName)
                                                .font(.customHeader())
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }
                                            .padding(.leading,20)
                                    )
                                    .padding(.bottom,12)

                            }
                        }
                    }
                    .navigationTitle("Toucher")
                    .padding(.horizontal,16)
                    .navigationDestination(for: TouchGesture.self) { brand in
                        VStack{
                            Button {
                                navigationPath = []
                            } label: {
                                HStack(spacing: 5) {
    
                                    Image(systemName: "chevron.backward")
                                        .frame(width: 6, height: 11)
                                        .foregroundColor(.pink)
    
                                    Text("처음으로")
                                        .font(.system(size: 16))
                                        .foregroundColor(.pink)
    
                                    Spacer()
    
                                    Text("\(brand.name)")
                                        .font(.system(size: 17))
                                        .fontWeight(.black)
                                        .foregroundColor(.gray)
    
                                    Spacer()
    
                                    Spacer()
    
    
                                }
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.horizontal,16)
                                .padding(.vertical,20)
                                .background(Color("HeaderColor"))
                                
    
                            }
                            viewForBrand(brand)
                            
                            
                            
                        }
                    }
                }
            }
        }.accentColor(.red)
        
        
    }
    func viewForBrand(_ brand: TouchGesture) -> AnyView {
        switch brand.name {
        case "길게 누르기":
            return AnyView(LongPressMain())
        case "두 번 누르기":
            return AnyView(DoubleTapView())
        case "화면 움직이기":
            return AnyView(PanViewMain())
        case "끌어오기":
            return AnyView(DragViewMain())
        case "살짝 쓸기":
            return AnyView(SwipeViewMain())
        case "확대, 축소하기":
            return AnyView(ZoomViewMain())
        case "회전하기":
            return AnyView(RotationViewMain())
        default:
            return AnyView(Color.gray)
        }
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
