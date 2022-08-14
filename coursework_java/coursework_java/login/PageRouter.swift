//
//  PageRouter.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/23/22.
//

import SwiftUI
class PageRouter: ObservableObject {
  @Published var currentPage: Page = .login
}

enum Page {
  case login
  case main
  case guestMode
}
