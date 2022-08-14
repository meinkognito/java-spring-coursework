//
//  Journal.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Journal: Codable, Identifiable, Hashable {
  let id: Int
  var books: [Book]
  var clients: [Client]
  var beginDate, endDate, returnDate: String
}

private actor JournalServiceStore {
  private var loadedItems = [Journal]()

  func load() async throws -> [Journal] {
    return try await RequestManager().perform(JournalRequest.getAll)
  }
}

class JournalService: ObservableObject {
  private let store = JournalServiceStore()
  @Published var items = [Journal]()

  public init() {}
}

extension JournalService {
  @MainActor
  func fetch() async throws {
    items = try await store.load()
  }
}
