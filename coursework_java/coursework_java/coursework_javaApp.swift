//
//  coursework_javaApp.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import SwiftUI

@main
struct coursework_javaApp: App {
  @StateObject private var pageRouter = PageRouter()

  var body: some Scene {
    WindowGroup {
      ContentView(pageRouter: pageRouter)
    }
  }
}
