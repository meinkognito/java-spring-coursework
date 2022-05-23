//
//  BookView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI

struct BooksView: View {
  @Binding var journal: Journal

  var body: some View {
    VStack {
      HStack {
        Spacer()
        NavigationLink {
          AddBookView(books: $journal.books)
            .onDisappear {
              Task {
                let _: Journal = try await RequestManager().perform(
                  JournalRequest.update(id: journal.id, with:
                    Journal(
                      id: journal.id,
                      books: journal.books,
                      clients: journal.clients,
                      beginDate: journal.beginDate,
                      endDate: journal.endDate,
                      returnDate: journal.returnDate
                    ))
                )
              }
            }
        } label: {
          Image(systemName: "plus")
            .foregroundColor(.accentColor)
        }.padding()
      }
      List {
        ForEach(journal.books) { book in
          NavigationLink {
            BookView(book: book, books: $journal.books)
              .onDisappear {
                Task {
                  let _: Journal = try await RequestManager().perform(
                    JournalRequest.update(id: journal.id, with:
                      Journal(
                        id: journal.id,
                        books: journal.books,
                        clients: journal.clients,
                        beginDate: journal.beginDate,
                        endDate: journal.endDate,
                        returnDate: journal.returnDate
                      ))
                  )
                }
              }
          }

            label: {
              Text(book.name)
            }
        }.onDelete { index in
          journal.books.remove(atOffsets: index)
          Task {
            let _: Journal = try await RequestManager().perform(
              JournalRequest.update(id: journal.id, with:
                Journal(
                  id: journal.id,
                  books: journal.books,
                  clients: journal.clients,
                  beginDate: journal.beginDate,
                  endDate: journal.endDate,
                  returnDate: journal.returnDate
                ))
            )
          }
        }
      }
    }
  }
}
