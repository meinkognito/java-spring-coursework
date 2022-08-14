//
//  BookTypeRequest.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/22/22.
//

import Foundation

enum BookTypeRequest: RequestProtocol {
  case getAll
  case getById(id: Int)

  case add(bookType: BookType)

  case update(id: Int, with: BookType)

  case delete(id: Int)

  var path: String {
    switch self {
    case .getAll: return "/bookTypes"
    case let .getById(id): return "/bookType/\(id)"
    case .add: return "/addBookType"
    case let .update(id, _): return "/updateBookType/\(id)"
    case let .delete(id): return "/deleteBookType/\(id)"
    }
  }

  var params: [String: Any] {
    switch self {
    case .getAll, .getById, .delete: return [:]
    case let .add(bookType), let .update(_, bookType):
      var params: [String: BookType] = [:]
      params["empty"] = bookType
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
