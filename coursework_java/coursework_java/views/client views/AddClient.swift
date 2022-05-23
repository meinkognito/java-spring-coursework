//
//  AddClient.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/24/22.
//

import SwiftUI

struct AddClient: View {
  @State var client = Client()
  @Binding var clients: [Client]
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    VStack {
      HStack {
        Text("First name:").bold()
        TextField("", text: $client.firstName)
      }.font(.title)

      HStack {
        Text("Last name:").bold()
        TextField("", text: $client.lastName)
      }.font(.title)

      HStack {
        Text("Pather name: ").bold()
        TextField("", text: $client.patherName)
      }.font(.title3)
      Divider()
        .padding()
      Text("Passport info")
        .font(.title2.bold())
        .padding(.bottom)
      HStack {
        Text("Seria: ").bold()
        TextField("", text: $client.passportSeria)
      }.font(.title3)
        .padding(.bottom)
      HStack {
        Text("Number: ").bold()
        TextField("", text: $client.passportNumber)
      }.font(.title3)
        .padding(.bottom)
      Spacer()

      Button {
        Task {
          do {
            clients.append(try await RequestManager().perform(ClientRequest.add(client: client)))
            presentationMode.wrappedValue.dismiss()

          } catch {
            print(error.localizedDescription)
          }
        }
      } label: {
        Text("Save")
      }.buttonStyle(.bordered)
    }
    .padding()
  }
}
