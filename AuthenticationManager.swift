import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var username = ""
    @Published var errorMessage = ""
    
    func login(username: String, password: String) {
        // In a real app, you would validate against a backend service
        // This is a simple example
        if !username.isEmpty && !password.isEmpty {
            self.username = username
            self.isAuthenticated = true
            self.errorMessage = ""
        } else {
            self.errorMessage = "Please enter both username and password"
        }
    }
    
    func logout() {
        isAuthenticated = false
        username = ""
        errorMessage = ""
    }
}
