import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct WebViewContainer: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @AppStorage("webViewURL") private var urlString = "https://www.google.com"
    @State private var showURLInput = false
    @State private var tempURL = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if let url = URL(string: urlString) {
                    WebView(url: url)
                } else {
                    Text("Invalid URL")
                }
            }
            .navigationBarItems(
                leading: Button("Logout") {
                    authManager.logout()
                },
                trailing: Button("Configure URL") {
                    tempURL = urlString
                    showURLInput = true
                }
            )
            .sheet(isPresented: $showURLInput) {
                NavigationView {
                    Form {
                        TextField("Enter URL", text: $tempURL)
                            .autocapitalization(.none)
                            .keyboardType(.URL)
                    }
                    .navigationBarItems(
                        leading: Button("Cancel") {
                            showURLInput = false
                        },
                        trailing: Button("Save") {
                            if URL(string: tempURL) != nil {
                                urlString = tempURL
                            }
                            showURLInput = false
                        }
                    )
                    .navigationTitle("Configure URL")
                }
            }
        }
    }
}
