//
//  AddBookView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct AddBookView: View {
  @State var book = Book()
  @Binding var books: [Book]
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    VStack {
      HStack(alignment: .center) {
        Text("Book title:").bold()
        TextField("", text: $book.name)
      }.font(.title2)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("Available:").bold()
        TextField("", value: $book.count, formatter: NumberFormatter())
      }.font(.title3)

      Divider()
        .padding()

      HStack(alignment: .center) {
        Text("Jenre:").bold()
        TextField("", text: $book.type.name)
      }.font(.title2)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("Books of jenre available:").bold()
        TextField("", value: $book.type.count, formatter: NumberFormatter())
      }.font(.title3)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("No fine day count:").bold()
        TextField("", value: $book.type.dayCount, formatter: NumberFormatter())
      }.font(.title3)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("Fine of\nreturning late:").bold()
        TextField("", value: $book.type.fine, formatter: NumberFormatter())
      }.font(.title3)

      Spacer()

      Button {
        Task {
          do {
            books.append(try await RequestManager().perform(BookRequest.add(book: book)))
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
