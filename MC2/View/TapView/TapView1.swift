

import SwiftUI

struct TapView1: View {
    @Binding var tag :Int
    @State private var ballSize : CGFloat = 95


    var body: some View {
        VStack{
            Text("안녕하세요.\n저는 터처 요청 김터치예요.\n한번 더 눌러보실래요?")
                .font(.system(size: 40 , weight: .bold))
                .frame(height : 200)
            Image("Bell")
            
            Button(action: {
                tag += 1
            }) {
                Image("TouchBall")
                    .resizable()
                    .scaledToFit()
                    .frame(width: ballSize,height: ballSize)
                    .animation(Animation.linear(duration: 1.3) .repeatForever(autoreverses: true))
                    .onAppear{
                        ballSize = 130}
                    }
            }
        }
    }




struct TapView1_Previews: PreviewProvider {
    static var previews: some View {
        TapViewMain()
    }
}
