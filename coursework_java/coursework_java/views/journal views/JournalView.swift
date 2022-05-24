//
//  JournalView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

enum JournalTab {
  case books
  case clients
}

struct JournalView: View {
  @State var tab: JournalTab = .books
  @State var journal: Journal
  @Binding var isGuest: Bool

  var body: some View {
    TabView {
      BooksView(journal: $journal, isGuest: $isGuest)
        .tag(JournalTab.books)
        .tabItem {
          Image(systemName: "books.vertical")
          Text("Books")
        }

      ClientsView(journal: $journal, isGuest: $isGuest)
        .tag(JournalTab.clients)
        .tabItem {
          Image(systemName: "person.2")
          Text("Clients")
        }
    }
    .navigationTitle("Journal \(journal.id)")
  }
}
