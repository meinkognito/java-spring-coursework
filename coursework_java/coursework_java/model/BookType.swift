//
//  BookType.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct BookType: Codable, Identifiable, Hashable {
  let id: Int
  var name: String
  var count, fine, dayCount: Int
}

//private actor BookTypeServiceStore {
//  private var loadedItems = [BookType]()
//
//  func load() async throws -> [BookType] {
//    return try await RequestManager().perform(BookTypeRequest.getAll)
//  }
//}
//
//class BookTypeService: ObservableObject {
//  private let store = BookTypeServiceStore()
//  @Published var items = [BookType]()
//
//  public init() {}
//}
//
//extension BookTypeService {
//  @MainActor
//  func fetch() async throws {
//    items = try await store.load()
//  }
//}
