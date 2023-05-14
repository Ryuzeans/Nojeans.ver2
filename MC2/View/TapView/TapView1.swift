

import SwiftUI

struct TapView1: View {
    @Binding var tag :Int
    @State private var ballSize : CGFloat = 95


    var body: some View {
        VStack{
            HStack {
                Text("안녕하세요.\n저는 터치 요청 김터치예요.\n한번 더 눌러보실래요?")
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .font(.system(size: 40 , weight: .bold))
                    .frame(height : 200)
                   // .padding(.bottom,100)
            }
            .frame(height: 200)
            .padding(.bottom, 10)
            
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding(.bottom,100)
                       
            Button(action: {
                tag += 1
            }) {
                Image("TouchBell2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: ballSize,height: ballSize)
                    .overlay{
                        Image("bell2").padding(.bottom,180)
                    }
                    .animation(Animation.linear(duration: 1.3) .repeatForever(autoreverses: true))
                    .onAppear{
                        ballSize = 130}
                    }
            }
        }
    }




//struct TapView1_Previews: PreviewProvider {
//    static var previews: some View {
//        TapViewMain()
//    }
//}
