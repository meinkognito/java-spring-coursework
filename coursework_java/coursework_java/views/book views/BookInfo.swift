//
//  BookInfo.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct BookInfo: View {
  @State var book: Book
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Available -")
        Text("\(book.count)")
          .bold()
      }.font(.title3)
      Divider()
        .padding()
      Text(book.type.name)
        .font(.title2.bold())
        .padding(.bottom)
      HStack {
        Text("Books of jenre available -")
        Text("\(book.type.count)").bold()
      }.font(.title3)
        .padding(.bottom)
      HStack {
        Text("Days you can grab it for free -")
        Text("\(book.type.dayCount)").bold()
      }.font(.title3)
        .padding(.bottom)
      HStack {
        Text("Fine of returning late  -")
        Text("\(book.type.fine)").bold()
      }.font(.title3)
      Spacer()
    }
    .padding()
    .navigationTitle(book.name)
    .navigationBarTitleDisplayMode(.large)
  }
}
