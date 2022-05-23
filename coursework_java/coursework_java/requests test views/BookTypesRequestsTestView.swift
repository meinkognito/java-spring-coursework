//
//  BookTypesRequestsTestView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/22/22.
//

import SwiftUI

struct BookTypesRequestsTestView: View {
  private var requestManager = RequestManager()

  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      Button(action: {
        Task {
          do {
            let bookTypes: [BookType] = try await requestManager.perform(BookTypeRequest.getAll)
            print(bookTypes)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("getAllBooks") })

      Button(action: {
        Task {
          do {
            let bookType: BookType = try await requestManager.perform(BookTypeRequest.getById(id: 1))
            print(bookType)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("get 1st book") })

      Button(action: {
        Task {
          do {
            let newBook: BookType = try await requestManager.perform(BookTypeRequest.add(bookType:
              BookType(
                id: 1,
                name: "newType",
                count: 10,
                fine: 10,
                dayCount: 10
              )))
            print(newBook)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("add book") })

      Button(action: {
        Task {
          do {
            let updatedBook: BookType = try await requestManager.perform(BookTypeRequest.update(id: 1, with:
                BookType(
                  id: 2,
                  name: "newType",
                  count: 10,
                  fine: 10,
                  dayCount: 10
                )))
            print(updatedBook)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("update book") })

      Button(action: {
        Task {
          do {
            let book: BookType = try await requestManager.perform(BookTypeRequest.delete(id: 1))
            print(book)
          } catch {
            print(error.localizedDescription)
          }
        }
      }, label: { Text("delete 1st book") })
    }
  }
}

struct BookTypesRequestsTestView_Previews: PreviewProvider {
  static var previews: some View {
    BookTypesRequestsTestView()
  }
}
