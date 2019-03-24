import Foundation

// Class AccounstAPI represents the accounts API.
class AccountsAPI {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = String(format: "%@/twirp/accounts.Accounts", apiURI) // Set API URI
    }
    
    // NewAccount initializes a new account via the provieded API lookup URI.
    func NewAccount() -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = [:] // Empty JSON request
        
        let jsonData = try? JSONSerialization.data(withJSONObject: requestContents) // Get JSON representation
        
        var request = URLRequest(url: URL(string: String(format: "%@/NewAccount", URI))!) // Craft request
        request.httpMethod = "post" // Set HTTP method
        
        request.httpBody = jsonData // Set request body
        
        var responseJSON: [String: Any]? = nil // Init response buffer
        
        var err: Error? = nil // Init error buffer
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { // Check for errors
                err = error! // Set error
                
                return // Return
            }

            responseJSON = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any] // Set response JSON
        }
        
        task.resume() // Start task
        
        return (responseJSON, err) // Return response
    }
}
