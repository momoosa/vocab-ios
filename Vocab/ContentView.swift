//
//  ContentView.swift
//  Vocab
//
//  Created by Mo Moosa on 29/02/2020.
//  Copyright © 2020 Mo Moosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: GlossaryViewModel
    var body: some View {
        return VStack {

            TextField("Enter a word", text: $viewModel.searchText)
            List {
                ForEach(viewModel.filteredItems) { item in
                    Row(item: item)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        var items = [Item]()

        for index in 0..<100 {
            let item = Item()
            item.title = "Title \(index)"
            item.translatedValue = "Title \(index)"
            items.append(item)
        }
        return ContentView(viewModel: GlossaryViewModel(items: items))
    }
}
