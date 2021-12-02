//
//  LoginView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 26.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {

    @State private var password = ""
    @State private var login = ""
    private let startColor = #colorLiteral(red: 0, green: 0.5416892767, blue: 0.9964188933, alpha: 1)

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
                LoginButtonView()
                Spacer()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(Color(uiColor: startColor))
            .font(.system(.title2))
        }
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LoginView()
                .previewDevice("iPhone SE")
            LoginView()
                .previewDevice("iPhone 12")
        }
    }
}

extension UIApplication {

    func hideKeyboard() {
        self.sendAction(#selector(UIResponder.resignFirstResponder),
                        to: nil, from: nil, for: nil)
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
    }
}

struct LoginButtonView: View {

    @State private var password = ""
    @State private var login = ""
    private let startColor = #colorLiteral(red: 0, green: 0.5416892767, blue: 0.9964188933, alpha: 1)

    var body: some View {
        Button(action: onPressedStartButton) {
            Text("Вход")
                .font(.system(size: 24, weight: .semibold, design: .serif))
                .foregroundColor(.white)
                .frame(width: 100.0)
            Image(systemName: "arrow.right.circle.fill")
                .foregroundColor(.white)
                .padding()
        }
        .disabled(login.isEmpty ||
                  password.isEmpty)
        .background(Color(uiColor: startColor))
        .cornerRadius(15)
        .shadow(color: .white, radius: 15, x: 0, y: 0)
    }
}


func onPressedStartButton () {

}
