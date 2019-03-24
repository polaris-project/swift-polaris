import Foundation

// Class AccounstAPI represents the accounts API.
public class AccountsAPI: NSObject, URLSessionDelegate {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = String(format: "%@/twirp/accounts.Accounts", apiURI) // Set API URI
    }
    
    // NewAccount initializes a new account via the provieded API lookup URI.
    public func NewAccount() -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = [:] // Empty JSON request
        
        let jsonData = try? JSONSerialization.data(withJSONObject: requestContents) // Get JSON representation
        
        var request = URLRequest(url: URL(string: String(format: "%@/NewAccount", URI))!) // Craft request
        request.httpMethod = "post" // Set HTTP method
        
        request.httpBody = jsonData // Set request body
        
        var responseJSON: [String: Any]? = nil // Init response buffer
        
        var err: Error? = nil // Init error buffer
        
        let sem = DispatchSemaphore(value: 0) // Create sync buffer
        
        let task = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.init()).dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { // Check for errors
                err = error! // Set error
                
                return // Return
            }

            responseJSON = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any] // Set response JSON
            
            sem.signal() // Dispatch signal
        }
        
        task.resume() // Start task
        
        sem.wait() // Wait for finish
        
        return (responseJSON, err) // Return response
    }
    
    // urlSession forces a self-signed TLS cert.
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!)) // Use credential
    }
}
