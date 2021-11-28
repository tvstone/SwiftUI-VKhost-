//
//  LoginView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 26.11.2021.
//

import SwiftUI
import Combine

struct LoginView: View {

    @State private var startColor = #colorLiteral(red: 0, green: 0.5416892767, blue: 0.9964188933, alpha: 1)
    @State private var password = ""
    @State private var login = ""

    var body: some View {

        ZStack{Color("AccentColor")

            Color(uiColor: startColor)
                .ignoresSafeArea(.all)

            VStack(spacing: 30){

                Image("vkontakte")
                    .resizable()
                    .scaledToFit()

                ScrollView {
                    VStack() {
                        HStack(alignment: .center, spacing: 20.0) {

                            Text("Логин")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .frame(width: 100.0)
                            TextField("Введите логин", text: $login)
                                .padding(5.0)
                                .background()
                        }

                        HStack(alignment: .center, spacing: 20) {

                            Text("Пароль")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.trailing)
                                .frame(width: 100.0)
                            SecureField("Введите пароль", text: $password)
                                .padding(5)
                                .background()
                        }
                        Spacer()
                    }
                    .frame(maxWidth : 350)
                }


                Button(action: onPressedStartButton) {
                    Text("Вход")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .frame(width: 100.0)
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(.white)
                        .padding()
                }
                .disabled(login.isEmpty ||
                          password.isEmpty)
                .background(Color(uiColor: startColor))
                .cornerRadius(50)
                .shadow(color: .white, radius: 5, x: 3, y: 5)
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

func onPressedStartButton () {

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
