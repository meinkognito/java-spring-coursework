//
//  ClientsRequestTestView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct ClientsRequestTestView: View {
  private var requestManager = RequestManager()

  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      Button(action: {
        Task {
          do {
            let clients: [Client] = try await requestManager.perform(ClientRequest.getAll)
            print(clients)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("getAll") })

      Button(action: {
        Task {
          do {
            let client: Client = try await requestManager.perform(ClientRequest.getById(id: 1))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("get 1st") })

      Button(action: {
        Task {
          do {
            let client: Client = try await requestManager.perform(ClientRequest.add(client:
              Client(id: 1,
                     firstName: "abab",
                     lastName: "abab",
                     patherName: "abab",
                     passportSeria: "abab",
                     passportNumber: "abab")))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("add") })

      Button(action: {
        Task {
          do {
            let client: Client = try await requestManager.perform(ClientRequest.update(id: 1, with:
              Client(id: 2,
                     firstName: "abab",
                     lastName: "abab",
                     patherName: "abab",
                     passportSeria: "abab",
                     passportNumber: "abab")))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("update") })

      Button(action: {
        Task {
          do {
            let client: Client = try await requestManager.perform(ClientRequest.delete(id: 1))
            print(client)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("delete") })
    }
  }
}

struct ClientsRequestTestView_Previews: PreviewProvider {
  static var previews: some View {
    ClientsRequestTestView()
  }
}
