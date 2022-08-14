//
//  JournalsView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct JournalsView: View {
  @StateObject var pageRouter: PageRouter
  @StateObject var journalService = JournalService()
  @State var isGuest = false

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
        .onDelete { index in
          journalService.items.remove(atOffsets: index)
          Task {
            let _: Journal = try await RequestManager().perform(JournalRequest.delete(id: index.first ?? 0))
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

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    JournalsView(pageRouter: PageRouter())
  }
}
