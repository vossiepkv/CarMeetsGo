import SwiftUI
import Firebase

@main
struct CarMeetsGoApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @StateObject var authVM = AuthViewModels()

    var body: some View {
        if authVM.user == nil {
            SignupView(authVM: authVM)
        } else {
            ContentView(authVM: authVM)
        }
    }
}

