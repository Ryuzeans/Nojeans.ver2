
import SwiftUI

struct TapViewMain: View {
    @State private var tag: Int = 0
    
    var body: some View {
           ZStack {
                  switch tag {
                  case 0:
                      TapView(tag: $tag)
                  case 1:
                      TapView1(tag: $tag)
                  case 2:
                      TapView2(tag: $tag)

                  default:
                      TapView(tag: $tag)
                  }

              }
           .navigationBarBackButtonHidden(true)

    }

}

struct TapViewMain_Previews: PreviewProvider {
    static var previews: some View {
        TapViewMain()
    }
}
