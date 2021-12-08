//
//  LoginView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 26.11.2021.
//

import SwiftUI

struct LoginView: View {

    @State private var startColor = #colorLiteral(red: 0, green: 0.5416892767, blue: 0.9964188933, alpha: 1)
    @State private var login = "tvv"
    @State private var password = "12345"
    @State private var showIncorrectPasssword : Bool = false
    @Binding var showBaseView : Bool

    var body: some View {

        ZStack{
            Color(uiColor: startColor)
                .ignoresSafeArea(.all)
            VStack(spacing: 30){
                Image("vkontakte")
                    .resizable()
                    .scaledToFit()
                ScrollView {
                    VStack() {
                        HStack(alignment: .center, spacing: 20.0) {
                            LoginTitles {Text("Логин")}
                            TextField("Введите логин", text: $login)
                                .modifier(TextFieldMod())
                        }
                        HStack(alignment: .center, spacing: 20) {
                            LoginTitles {Text("Пароль")}
                            SecureField("Введите пароль", text: $password)
                                .modifier(TextFieldMod())
                        }
                        Spacer()
                    }
                    .font(.system(size: 24, weight: .semibold, design: .serif))
                    .frame(maxWidth : 350)
                }

                Button(action: onPressedStartButton) {
                    Text("Вход")
                        .font(.system(size: 24, weight: .semibold, design: .serif))
                        .foregroundColor(.white)
                        .frame(width: 100.0)
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.white)
                        .padding()
                }
                .disabled(login.isEmpty || password.isEmpty)
                .background(Color(uiColor: startColor))
                .cornerRadius(15)
                .shadow(color: .white, radius: 15, x: 0, y: 0)
                Spacer()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(Color(uiColor: startColor))
            .font(.system(.title2))
        }
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
        .alert(isPresented: $showIncorrectPasssword){
            Alert(title: Text("Внимание!"),
                  message: Text("Неверный логин или пароль"),
                  dismissButton: .cancel())
        }
    }

    private func onPressedStartButton () {
        UIApplication.shared.hideKeyboard()
        if login == "tvv" && password == "12345" {
            self.showBaseView.toggle()
        }else{
            self.showIncorrectPasssword.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LoginView(showBaseView: .constant(false))
                .previewDevice("iPhone SE")
            LoginView(showBaseView: .constant(false))
                .previewDevice("iPhone 12")
        }
    }
}

struct LoginTitles<Content : View> : View {
    var content : Content

    init (@ViewBuilder content : () -> Content){
        self.content = content()
    }
    var body: some View {
        content
            .foregroundColor(.white)
            .multilineTextAlignment(.trailing)
            .frame(width: 100.0)
    }
}

struct TextFieldMod : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background()
            .cornerRadius(15)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
    }
}

