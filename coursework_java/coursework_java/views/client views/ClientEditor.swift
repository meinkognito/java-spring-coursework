//
//  ClientEditor.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/24/22.
//

import SwiftUI

struct ClientEditor: View {
  @Binding var client: Client

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("First name:").bold()
        TextField("\(client.firstName)", text: $client.firstName)
      }.font(.title)
      
      HStack {
        Text("Last name:").bold()
        TextField("\(client.lastName)", text: $client.lastName)
      }.font(.title)
    
      HStack {
        Text("Pather name: ").bold()
        TextField("\(client.patherName)", text: $client.patherName)
      }.font(.title3)
      Divider()
        .padding()
      Text("Passport info")
        .font(.title2.bold())
        .padding(.bottom)
      HStack {
        Text("Seria: ").bold()
        TextField("\(client.passportSeria)", text: $client.passportSeria)
      }.font(.title3)
        .padding(.bottom)
      HStack {
        Text("Number: ").bold()
        TextField("\(client.passportNumber)", text: $client.passportNumber)
      }.font(.title3)
        .padding(.bottom)
      Spacer()
    }
    .padding()
  }
}
