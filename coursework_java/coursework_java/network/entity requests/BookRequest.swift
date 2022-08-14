//
//  BookRequest.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

enum BookRequest: RequestProtocol {
  case getAll
  case getById(id: Int)

  case add(book: Book)

  case update(id: Int, with: Book)

  case delete(id: Int)

  var path: String {
    switch self {
    case .getAll: return "/books"
    case let .getById(id): return "/book/\(id)"
    case .add: return "/addBook"
    case let .update(id, _): return "/updateBook/\(id)"
    case let .delete(id): return "/deleteBook/\(id)"
    }
  }

  var params: [String: Any] {
    switch self {
    case .getAll, .getById, .delete: return [:]
    case let .add(book), let .update(_, book):
      var params: [String: Book] = [:]
      params["empty"] = book
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
