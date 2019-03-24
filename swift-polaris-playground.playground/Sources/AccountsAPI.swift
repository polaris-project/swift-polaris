import Foundation

// Class AccounstAPI represents the accounts API.
public class AccountsAPI {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = String(format: "%@/twirp/accounts.Accounts", apiURI) // Set API URI
    }
    
    // NewAccount initializes a new account via the provieded API lookup URI.
    public func NewAccount() -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = [:] // Empty JSON request
        
        return Requests.MakeRequest(requestURI: String(format: "%@/NewAccount", URI), requestContents: requestContents) // Return response
    }
}
