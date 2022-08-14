//
//  ClientView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct ClientView: View {
  @Environment(\.editMode) var editMode
  @State var client: Client
  @State private var draftClient = Client()
  @Binding var clients: [Client]
  @State private var index = 0
  @Binding var isGuest: Bool

  var body: some View {
    VStack(alignment: .leading) {
      if !isGuest {
        HStack {
          if editMode?.wrappedValue == .active {
            Button("Cancel", role: .cancel) {
              draftClient = client
              editMode?.animation().wrappedValue = .inactive
            }
          }

          Spacer()
          EditButton()
        }
      }

      if !isGuest {
        ClientInfo(client: client)
      } else {
        if editMode?.wrappedValue == .inactive {
          ClientInfo(client: client)
        } else {
          ClientEditor(client: $draftClient)
            .onAppear {
              draftClient = client
            }
            .onDisappear {
              client = draftClient
              Task {
                do {
                  let _: Client = try await RequestManager().perform(
                    ClientRequest.update(id: client.id, with: draftClient)
                  )
                  clients[index] = client
                } catch {
                  print(error.localizedDescription)
                }
              }
            }
        }
      }
    }
    .onAppear {
      draftClient = client
      index = clients.firstIndex(of: client) ?? 0
    }
    .padding()
  }
}
