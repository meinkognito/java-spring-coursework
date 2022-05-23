//
//  ClientRequest.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/22/22.
//

import Foundation

enum ClientRequest: RequestProtocol {
  case getAll
  case getById(id: Int)

  case add(client: Client)

  case update(id: Int, with: Client)

  case delete(id: Int)

  var path: String {
    switch self {
    case .getAll: return "/clients"
    case let .getById(id): return "/client/\(id)"
    case .add: return "/addClient"
    case let .update(id, _): return "/updateClient/\(id)"
    case let .delete(id): return "/deleteClient/\(id)"
    }
  }

  var params: [String: Any] {
    switch self {
    case .getAll, .getById, .delete: return [:]
    case let .add(client), let .update(_, client):
      var params: [String: Client] = [:]
      params["empty"] = client
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
