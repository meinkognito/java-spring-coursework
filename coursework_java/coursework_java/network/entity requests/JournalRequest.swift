//
//  JournalRequest.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/22/22.
//

import Foundation

enum JournalRequest: RequestProtocol {
  case getAll
  case getById(id: Int)

  case add(journal: Journal)

  case update(id: Int, with: Journal)

  case delete(id: Int)

  var path: String {
    switch self {
    case .getAll: return "/journals"
    case let .getById(id): return "/journal/\(id)"
    case .add: return "/addJournal"
    case let .update(id, _): return "/updateJournal/\(id)"
    case let .delete(id): return "/deleteJournal/\(id)"
    }
  }

  var params: [String: Any] {
    switch self {
    case .getAll, .getById, .delete: return [:]
    case let .add(journal), let .update(_, journal):
      var params: [String: Journal] = [:]
      params["empty"] = journal
      return params
    }
  }

  var requestType: RequestType {
    switch self {
    case .getAll, .getById: return .GET
    case .add: return .POST
    case .update: return .PUT
    case .delete: return .DELETE
    }
  }
}
