//
//  Client.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

struct Client: Codable, Identifiable, Hashable {
  let id: Int
  var firstName, lastName, patherName, passportSeria, passportNumber: String

  init() {
    id = Int.random(in: 5 ..< 40)
    firstName = ""
    lastName = ""
    patherName = ""
    passportSeria = ""
    passportNumber = ""
  }

  init(id: Int, firstName: String, lastName: String, patherName: String, passportSeria: String, passportNumber: String) {
    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.patherName = patherName
    self.passportSeria = passportSeria
    self.passportNumber = passportNumber
  }
}

private actor ClientServiceStore {
  private var loadedItems = [Client]()

  func load() async throws -> [Client] {
    return try await RequestManager().perform(ClientRequest.getAll)
  }
}

class ClientService: ObservableObject {
  private let store = ClientServiceStore()
  @Published var items = [Client]()

  public init() {}
}

extension ClientService {
  @MainActor
  func fetch() async throws {
    items = try await store.load()
  }
}
