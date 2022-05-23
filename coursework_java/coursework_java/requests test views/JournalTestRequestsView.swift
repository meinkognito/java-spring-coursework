//
//  JournalTestRequestsView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct JournalTestRequestsView: View {
  private var requestManager = RequestManager()

  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      Button(action: {
        Task {
          do {
            let clients: [Journal] = try await requestManager.perform(JournalRequest.getAll)
            print(clients)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("getAll") })

      Button(action: {
        Task {
          do {
            let client: Journal = try await requestManager.perform(JournalRequest.getById(id: 1))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("get 1st") })

      Button(action: {
        Task {
          do {
            let client: Journal = try await requestManager.perform(JournalRequest.add(journal:
              Journal(id: 1, books: [], clients: [], beginDate: "abab", endDate: "abab", returnDate: "abab")))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("add") })

      Button(action: {
        Task {
          do {
            let client: Journal = try await requestManager.perform(JournalRequest.update(id: 1, with:
              Journal(
                id: 1,
                books: [],
                clients: [],
                beginDate: "abab",
                endDate: "abab",
                returnDate: "abab"
              )))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("update") })

      Button(action: {
        Task {
          do {
            let client: Journal = try await requestManager.perform(JournalRequest.delete(id: 1))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("delete") })
    }
  }
}

struct JournalTestRequestsView_Previews: PreviewProvider {
  static var previews: some View {
    JournalTestRequestsView()
  }
}
