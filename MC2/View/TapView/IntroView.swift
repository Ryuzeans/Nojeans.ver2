//
//  IntroView.swift
//
//
//  Created by 하명관 on 2023/05/14.
//

import SwiftUI

struct IntroView: View {
    
    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State var showHomeView: Bool = false
    @Namespace var animation
    
    var body: some View {
        
        ZStack{
            
            if showHomeView{
                
                withAnimation{
                    MainView()
                        .transition(.move(edge: .trailing))
                }

            }else{
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    
                    IntroScreen()
                    
                    WalkThroughScreens()
                    
                    NavBar()
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showHomeView)
    }

    @ViewBuilder
    func WalkThroughScreens()->some View{
        
        let isLast = currentIndex == intros.count
        
        GeometryReader{
            let size = $0.size
            
            ZStack{
                // MARK: Walk Through Screens
                ForEach(intros.indices,id: \.self){index in
                    ScreenView(size: size, index: index)
                        .padding(.bottom,100)
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .bottom, content: {
                Indicators()
                    .opacity(isLast ? 0 : 1)
                    .animation(.easeInOut(duration: 0.35), value: isLast)
                    .offset(y: -180)
            })

//            .overlay(alignment: .bottom) {
//
//                ZStack{
//                    Image(systemName: "chevron.right")
//                        .font(.system(size: 20))
//                        .foregroundColor(Color("BrandColor"))
//                        .scaleEffect(!isLast ? 1 : 0.001)
//                        .opacity(!isLast ? 1 : 0)
//
//                    HStack{
//                        Text("Start")
//                            .font(.system(size: 20))
//                            .fontWeight(.bold)
//                            .foregroundColor(Color("white"))
//                            .frame(maxWidth: .infinity,alignment: .center)
//                    }
//                    .padding(.horizontal,15)
//                    .scaleEffect(isLast ? 1 : 1)
//                    .frame(height: isLast ? nil : 0)
//                    .opacity(isLast ? 1 : 0)
//                }
//                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
//                .foregroundColor(.black)
//                .background {
//                    RoundedRectangle(cornerRadius: isLast ? 10 : 30, style: isLast ? .continuous : .circular)
//                        .fill(Color("BrandColor"))
//
//                }
//                .onTapGesture {
//                    if currentIndex == intros.count{
//                        // Signup Action
//                        showHomeView = true
//                    }else{
//                        currentIndex += 1
//                    }
//                }
//                .offset(y: isLast ? -40 : -90)
//                // Animation
//                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
//            }
            .overlay(alignment: .bottom, content: {
                let isLast = currentIndex == intros.count
                
            })
            .offset(y: showWalkThroughScreens ? 0 : size.height)
        }
    }
    
    // Forgot to add in the YT Video
    @ViewBuilder
    func Indicators()->some View{
        HStack(spacing: 8){
            ForEach(intros.indices,id: \.self){index in
                Circle()
                    .fill(Color("BrandColor"))
                    .frame(width: 15, height: 15)
                    .overlay {
                        if currentIndex == index{
                            Circle()
                                .stroke(Color.black,lineWidth: 4)
                                .frame(width: 15, height: 15)
                                .matchedGeometryEffect(id: "INDICATOR", in: animation)
                        }
                    }
                
            }

        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: currentIndex)
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize,index: Int)->some View{
        let intro = intros[index]
        
        VStack(spacing: 10){
            
            Text(intro.title)
                .foregroundColor(.black)
                .font(.system(size: 38))
                .fontWeight(.bold)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150,alignment: .top)
                .padding(.top,30)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
                .onTapGesture {
                    if currentIndex == intros.count-1{
                        // Signup Action
                        showHomeView = true
                    }else{
                        currentIndex += 1
                    }
                }
        }
        .offset(y: -30)
    }
    

    
    @ViewBuilder
    func NavBar()->some View{
        let isLast = currentIndex == intros.count
        
        HStack{
            Button {
                // If Greater Than Zero Then Eliminating Index
                if currentIndex > 0{
                    currentIndex -= 1
                }else{
                    showWalkThroughScreens.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .font(.title3)
                    .foregroundColor(Color.black)
            }

            Spacer()
            
            Button("Skip"){
                currentIndex = intros.count
            }
            .font(.system(size: 20))
            .foregroundColor(Color.black)
            .opacity(isLast ? 0 : 1)
            .animation(.easeInOut, value: isLast)
        }
        .padding(.horizontal,45)
        .padding(.top,10)
        .frame(maxHeight: .infinity,alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }

    
    @ViewBuilder
    func WelcomeView(size: CGSize,index: Int)->some View{
        VStack(spacing: 10){
            
            Text("Endangerd Animals in Africa")
                .font(.system(size: 78).bold())
                .foregroundColor(.black)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            
        }
        .offset(y: 60)
    }
    
    @ViewBuilder
    func IntroScreen()->some View{
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 10){
                
                Image("DoubleCircle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height / 2)
                    .padding(.top,150)
                
//                Text("Endangerd")
//                    .foregroundColor(.black)
//                    .font(.system(size: 48).bold())
//                    .padding(.top,55)
                
                
                Text("시작하기")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.horizontal,40)
                    .padding(.vertical,14)
                    .foregroundColor(Color.white)
                    .background {
                        Rectangle()
                            .fill(Color("BrandColor"))
                            .cornerRadius(20)
                            .shadow(color: Color.black, radius: 1, y: 2)
                            
                    }
                    .onTapGesture {
                        showWalkThroughScreens.toggle()
                    }
                    .padding(.top,30)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .offset(y: showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

import SwiftUI

struct Intro: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    
}

var intros: [Intro] = [
    .init(imageName: "DoubleCircle", title: "저를 한번\n눌러보세요.\n\n"),
    .init(imageName: "DoubleCircle", title: "안녕하세요.\n저는 터치 요청 김터치예요.\n한번 더 눌러보실래요?" ),
    .init(imageName: "DoubleCircle", title: "잘하셨어요!\n이제 부터 저의 설명에 따라\n터치 여행을 떠나봐요.")
]


let dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is dummy text."
