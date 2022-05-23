//
//  ContentView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var pageRouter: PageRouter

  var body: some View {
    switch pageRouter.currentPage {
    case .login:
      LoginView(pageRouter: pageRouter)
    case .main:
      JournalsView(pageRouter: pageRouter)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(pageRouter: PageRouter())
  }
}
