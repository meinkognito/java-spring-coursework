//
//  LoginViewModel.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import Foundation

func validateToken(username: String) async throws {
  let requestManager = RequestManager()

  switch username {
  case "user":
    let _: BookType = try await requestManager.perform(BookTypeRequest.add(bookType:
      BookType(
        id: 5,
        name: "newType",
        count: 10,
        fine: 10,
        dayCount: 10
      )))

  case "admin":
    let _: BookType = try await requestManager.perform(BookTypeRequest.add(bookType:
      BookType(
        id: 5,
        name: "newType",
        count: 10,
        fine: 10,
        dayCount: 10
      )))

    let _: BookType = try await requestManager.perform(BookTypeRequest.delete(id: 5))

  default:
    throw NetworkError.incorrectCredentials
  }
}
