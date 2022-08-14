//
//  RequestsTestView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct RequestsTestView: View {
  @State private var selection: Tab = .books

  enum Tab {
    case books
    case bookTypes
    case clients
    case journals
  }

  var body: some View {
    TabView(selection: $selection) {
      BookRequestsTestView()
        .tabItem {
          Label("Books", systemImage: "house")
        }
        .tag(Tab.books)
      BookTypesRequestsTestView()
        .tabItem {
          Label("BookTypes", systemImage: "house")
        }
        .tag(Tab.bookTypes)

      ClientsRequestTestView()
        .tabItem {
          Label("Clients", systemImage: "house")
        }
        .tag(Tab.clients)

      JournalTestRequestsView()
        .tabItem {
          Label("Journals", systemImage: "house")
        }
        .tag(Tab.journals)
    }
  }
}

struct RequestsTestView_Previews: PreviewProvider {
  static var previews: some View {
    RequestsTestView()
  }
}
