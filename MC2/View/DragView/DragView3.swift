//
//  DragView3.swift
//  MC2
//
//  Created by musung on 2023/05/10.
//

import SwiftUI
import UniformTypeIdentifiers

struct DragView3: View {
    @Binding var tag :Int
    @State private var data = ["drag1", "drag2", "drag3", "drag4", "drag5", "drag6", "drag7" , "drag8"]
    @State private var allowReordering = true
    @State private var isReached = false
    @State private var isDroped = false
    var body: some View {
        ZStack(alignment: .bottom){
            VStack {
                Rectangle().frame(height:0)
                Spacer().frame(height: 41)
                if(!isReached){
                    Text("카메라 어플을\n3초 누른 뒤\n빈 원에 옮겨볼까요?")
                        .font(Font.customExplain())
                        .multilineTextAlignment(.center)
                        .padding(10)

                }
                else{
                    Text("잘 하셨어요\n\n")
                        .font(Font.customExplain())
                        .padding(10)

                }
                Spacer().frame(height: 86)
                ZStack{
                    LazyVGrid(columns: [
                      GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible()),
                      GridItem(.flexible())
                    ]) {
                        ReorderableForEach($data, allowReordering: $allowReordering,isReached: $isReached, isDroped: $isDroped) { item, isDragged in
                            Image(item)
                      }
                    }
                }
                VStack(alignment: .trailing){
                    Rectangle().frame(height:0)
                    Image("dragView_here").padding(10)
                }
                Spacer()
            }
            .padding()
            if(isReached){
                Button(action: {
                    tag += 1
                }) {
                    Text("다음").font(Font.customNextButton())
                }.btnStyle().padding(16)
            }
        }
    }
}

public struct ReorderableForEach<Data, Content>: View
where Data : Hashable, Content : View {
  @Binding var data: [Data]
  @Binding var allowReordering: Bool
    @Binding var isReached: Bool
    @Binding var isDroped: Bool
  private let content: (Data, Bool) -> Content

  @State private var draggedItem: Data?
  @State private var hasChangedLocation: Bool = false

  public init(_ data: Binding<[Data]>,
              allowReordering: Binding<Bool>,
              isReached: Binding<Bool>,
              isDroped: Binding<Bool>,
              @ViewBuilder content: @escaping (Data, Bool) -> Content) {
    _data = data
    _allowReordering = allowReordering
      _isReached = isReached
      _isDroped = isDroped
    self.content = content
  }

  public var body: some View {
    ForEach(data, id: \.self) { item in
      if allowReordering {
        content(item, hasChangedLocation && draggedItem == item)
          .onDrag {
            draggedItem = item
            return NSItemProvider(object: "\(item.hashValue)" as NSString)
          }
          .onDrop(of: [UTType.plainText], delegate: ReorderDropDelegate(
            item: item,
            data: $data,
            draggedItem: $draggedItem,
            hasChangedLocation: $hasChangedLocation,
            isReached: $isReached,
            isDroped: $isDroped
          ))
      } else {
        content(item, false)
      }
    }
  }

  struct ReorderDropDelegate<Data>: DropDelegate
  where Data : Equatable {
    let item: Data
    @Binding var data: [Data]
    @Binding var draggedItem: Data?
    @Binding var hasChangedLocation: Bool
      @Binding var isReached: Bool
      @Binding var isDroped: Bool

      func dropEntered(info: DropInfo) {
      guard item != draggedItem,
            let current = draggedItem,
            let from = data.firstIndex(of: current),
            let to = data.firstIndex(of: item)
      else {
        return
      }
      hasChangedLocation = true
      if data[to] != current {
          print(to)
          if(current as! String == "drag1" && to == 7){
              isDroped = true          }
          else{
              isDroped = false
          }
        withAnimation {
          data.move(fromOffsets: IndexSet(integer: from),
                    toOffset: (to > from) ? to + 1 : to)
        }
      }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
      DropProposal(operation: .move)
    }

    func performDrop(info: DropInfo) -> Bool {
        if(isDroped){
            isReached = true
        }
      hasChangedLocation = false
      draggedItem = nil
      return true
    }
  }
}
