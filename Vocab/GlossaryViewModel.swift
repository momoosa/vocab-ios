//
//  GlossaryViewModel.swift
//  Vocab
//
//  Created by Mo Moosa on 29/02/2020.
//  Copyright © 2020 Mo Moosa. All rights reserved.
//

import Combine
import SwiftUI

final class GlossaryViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    @Published var searchText: String = ""
    @Published var items = [Item]() {
        willSet {
            objectWillChange.send()
        }
    }
    @Published var filteredItems = [Item]() {
        willSet {
            objectWillChange.send()
        }
    }
    var filterCancellable: AnyCancellable?

    init(items: [Item]) {
        self.items = items

        filterCancellable = $searchText.sink { [weak self] (text) in
            print("§\(text)")
            self?.filterItems(for: text)
            print("\(self?.filteredItems.count)")
        }
    }

    func filterItems(for searchTerm: String) {
        guard searchTerm.isEmpty == false else {
            filteredItems = items
            return
        }
        filteredItems = items.filter({ item in
            if item.title.lowercased().contains(searchTerm.lowercased()) {
                return true
            }
            if let title = item.translatedValue?.lowercased(), title.contains(searchTerm.lowercased()) {
                return true
            }

            return false
        })
    }
}


class Item: ObservableObject, Identifiable {
    var identifier: UUID
    let objectWillChange = ObservableObjectPublisher()
    @Published var title: String = "" {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var translatedValue: String? {
        willSet {
            objectWillChange.send()
        }
    }

    init(identifier: UUID? = nil) {
        self.identifier = identifier ?? UUID()
    }
}
