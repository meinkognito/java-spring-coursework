//
//  LoginView.swift
//  coursework_java
//
//  Created by Denis Beloshitskiy on 5/19/22.
//

import SwiftUI

struct LoginView: View {
  @StateObject var pageRouter: PageRouter

  @State private var login = ""
  @State private var password = ""
  @State private var showingAlert = false

  var body: some View {
    NavigationView {
      VStack {
        VStack(alignment: .leading) {
          Text("Welcome")
            .font(.largeTitle.bold())
            .padding()
          Spacer()
            .frame(height: 150)

          TextField("Login:", text: self.$login)
            .padding()
            .background(.bar)
            .padding(.horizontal)
            .textInputAutocapitalization(.never)

          SecureField("Password:", text: self.$password)
            .padding()
            .background(.bar)
            .padding()
            .textInputAutocapitalization(.never)
        }
        Spacer()
        Button("Login", action: {
          Task {
            do {
              try await validateToken(username: login)
              pageRouter.currentPage = .main
            } catch {
              print(error.localizedDescription)
              showingAlert.toggle()
            }
          }
        })
        .alert("Invalid credentials!", isPresented: $showingAlert, actions: {})
        .buttonStyle(.bordered)
        .foregroundColor(.black)
        .font(.title3.bold())
        .padding()
        Spacer()

        Button {
          pageRouter.currentPage = .guestMode
        } label: {
          Text("Login as a guest")
        }.buttonStyle(.bordered)
          .foregroundColor(.black)
          .font(.title3.bold())
          .padding()
        Spacer()
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(pageRouter: PageRouter())
      .previewDevice("iPhone 12")
  }
}
