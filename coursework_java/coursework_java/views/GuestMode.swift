//
//  GuestMode.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/24/22.
//

import SwiftUI

struct GuestMode: View {
  @StateObject var pageRouter: PageRouter
  @StateObject var journalService = JournalService()
  @State var isGuest = true

  var body: some View {
    NavigationView {
      List {
        ForEach(journalService.items) { item in
          NavigationLink {
            JournalView(journal: item, isGuest: $isGuest)
          } label: {
            Text("Journal - \(item.id)")
          }
        }
      }.onAppear {
        Task {
          try? await journalService.fetch()
        }
      }
      .navigationBarTitle("Journals")
      .navigationBarItems(trailing:
        Button(
          action: {
            pageRouter.currentPage = .login
          }, label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
              .foregroundColor(.black)
          }
        ))
    }
  }
}
