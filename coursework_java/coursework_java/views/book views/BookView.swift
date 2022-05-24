//
//  BookView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct BookView: View {
  @Environment(\.editMode) var editMode
  @State var book: Book
  @State private var draftBook = Book()
  @Binding var books: [Book]
  @State private var index = 0
  @Binding var isGuest: Bool

  var body: some View {
    VStack(alignment: .leading) {
      if !isGuest {
        HStack {
          if editMode?.wrappedValue == .active {
            Button("Cancel", role: .cancel) {
              draftBook = book
              editMode?.animation().wrappedValue = .inactive
            }
          }

          Spacer()
          EditButton()
        }
      }

      if !isGuest {
        BookInfo(book: book)
      } else {
        if editMode?.wrappedValue == .inactive {
          BookInfo(book: book)
        } else {
          BookEditor(book: $draftBook)
            .onAppear {
              draftBook = book
            }
            .onDisappear {
              book = draftBook
              Task {
                do {
                  let _: Book = try await RequestManager().perform(
                    BookRequest.update(id: book.id, with: draftBook)
                  )
                  books[index] = book
                } catch {
                  print(error.localizedDescription)
                }
              }
            }
        }
      }
    }
    .onAppear {
      draftBook = book
      index = books.firstIndex(of: book) ?? 0
    }
    .padding()
  }
}
