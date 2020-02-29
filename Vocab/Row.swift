//
//  Row.swift
//  Vocab
//
//  Created by Mo Moosa on 29/02/2020.
//  Copyright © 2020 Mo Moosa. All rights reserved.
//

import SwiftUI

struct Row: View {
    @ObservedObject var item: Item
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(verbatim: self.item.title)
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
                    .background(Color(white: 0.5))
                Text(verbatim: "OK")
                    .frame(width: geometry.size.width * 0.5, height: geometry.size.height)
                    .background(Color(white: 0.7))
            }.frame(maxWidth: .infinity, minHeight: 50.0)
        }.padding(0)
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {

        let item = Item()
        item.title = "OK!"
        return Row(item: item)
    }
}
