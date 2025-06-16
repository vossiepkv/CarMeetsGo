import SwiftUI

struct ContentView: View {
    @ObservedObject var authVM: AuthViewModels

    var body: some View {
        VStack {
            Text("Car Meets Go")

            Button("Sign Out") {
                authVM.signOut()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authVM: AuthViewModels())
    }
}
