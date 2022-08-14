//
//  BookEditor.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct BookEditor: View {
  @Binding var book: Book

  var body: some View {
    VStack {
      HStack(alignment: .center) {
        Text("Book title:").bold()
        TextField("\(book.name)", text: $book.name)
      }.font(.title2)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("Available:").bold()
        TextField("\(book.count)", value: $book.count, formatter: NumberFormatter())
      }.font(.title3)

      Divider()
        .padding()

      HStack(alignment: .center) {
        Text("Jenre:").bold()
        TextField("\(book.type.name)", text: $book.type.name)
      }.font(.title2)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("Books of jenre available:").bold()
        TextField("\(book.type.count)", value: $book.type.count, formatter: NumberFormatter())
      }.font(.title3)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("No fine day count:").bold()
        TextField("\(book.type.dayCount)", value: $book.type.dayCount, formatter: NumberFormatter())
      }.font(.title3)
        .padding(.bottom)

      HStack(alignment: .center) {
        Text("Fine of\nreturning late:").bold()
        TextField("\(book.type.fine)", value: $book.type.fine, formatter: NumberFormatter())
      }.font(.title3)

      Spacer()
    }
    .padding()
  }
}
