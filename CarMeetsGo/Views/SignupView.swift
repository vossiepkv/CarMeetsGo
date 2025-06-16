import SwiftUI
import Foundation

struct SignupView: View {
    @ObservedObject var authVM: AuthViewModels
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Optional styling
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Optional styling
                .padding()

            Button("Signup") {
                authVM.signUp(email: email, password: password)
            }
            .padding()

            Button("Login") {
                authVM.signIn(email: email, password: password)
            }
            .padding()
        }
        .padding()
    }
}
