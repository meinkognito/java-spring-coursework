//
//  Book.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Book: Codable, Identifiable, Hashable {
  let id: Int
  var name: String
  var count: Int
  var type: BookType

  init() {
    id = Int.random(in: 5 ..< 40)
    name = ""
    count = 0
    type = BookType(id: 2, name: "", count: 0, fine: 0, dayCount: 0)
  }

  init(id: Int, name: String, count: Int, type: BookType) {
    self.id = id
    self.name = name
    self.count = count
    self.type = type
  }
}

private actor BookServiceStore {
  private var loadedBooks = [Book]()

  func loadBooks() async throws -> [Book] {
    return try await RequestManager().perform(BookRequest.getAll)
  }
}

class BookService: ObservableObject {
  private let store = BookServiceStore()
  @Published var books = [Book]()

  public init() {}
}

extension BookService {
  @MainActor
  func fetchBooks() async throws {
    books = try await store.loadBooks()
  }
}
