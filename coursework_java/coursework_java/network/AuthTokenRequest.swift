//
//  AuthTokenRequest.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {
  case auth

  var path: String {
    "/auth"
  }

  var params: [String: Any] {
    [
      "username": User.admin.username,
      "password": User.admin.password
    ]
  }

  var addAuthorizationToken: Bool {
    false
  }

  var requestType: RequestType {
    .POST
  }
}
