import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = AuthenticationManager()
    
    var body: some View {
        if authManager.isAuthenticated {
            WebViewContainer()
                .environmentObject(authManager)
        } else {
            LoginView()
                .environmentObject(authManager)
        }
    }
}
