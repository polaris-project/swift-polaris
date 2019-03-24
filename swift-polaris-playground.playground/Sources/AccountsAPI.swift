import Foundation

// Class AccounstAPI represents the accounts API.
class AccountsAPI {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = String(format: "%@/twirp/accounts.Accounts", apiURI) // Set API URI
    }
    
    // NewAccount initializes a new account via the provieded API lookup URI.
    func NewAccount() -> (String, Error) {
        let requestContents: [String: Any] = [:] // Empty JSON request
        
        let jsonData = try? JSONSerialization.data(withJSONObject: requestContents) // Get JSON representation
        
        var request = URLRequest(url: URL(string: String(format: "%@/NewAccount", URI))!) // Craft request
    }
}
