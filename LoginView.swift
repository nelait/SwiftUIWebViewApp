import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !authManager.errorMessage.isEmpty {
                    Text(authManager.errorMessage)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    authManager.login(username: username, password: password)
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}
