import Foundation
import FirebaseAuth
import SwiftUI

class AuthViewModels: ObservableObject {
    @Published var user: User?

    private var authStateDidChangeHandle: AuthStateDidChangeListenerHandle?

    init(){
        authStateDidChangeHandle = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.user = user
        }
    }

    deinit {
        if let handle = authStateDidChangeHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Signup Error: \(error.localizedDescription)")
            } else {
                print("User successfully signed up")
                self.user = result?.user
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Login Error: \(error.localizedDescription)")
            } else {
                print("User successfully signed in")
                self.user = result?.user
            }
        }
    }

    func signOut(){
        try? Auth.auth().signOut()
        self.user = nil
    }
}
