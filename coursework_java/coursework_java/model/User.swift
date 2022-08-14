//
//  User.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/21/22.
//

import Foundation

struct User {
  let username: String
  let password: String
  let userType: UserType

  static let user = User(username: "user", password: "p1$$w0rD", userType: .regularUser)
  static let admin = User(username: "admin", password: "ADm1n_p1$$w0rD", userType: .admin)
}

public enum UserType {
  case regularUser
  case admin
}
