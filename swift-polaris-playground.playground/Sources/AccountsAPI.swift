import Foundation

// Class AccounstAPI represents the accounts API.
public class AccountsAPI {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/accounts.Accounts" // Set API URI
    }
    
    // NewAccount initializes a new account via the provieded API lookup URI.
    public func NewAccount() -> ([String: Any]?, Error?) {
        return Requests.MakeRequest(requestURI: "\(URI)/NewAccount", requestContents: [:]) // Return response
    }
    
    // GetAllAccounts attempts to fetch the list of working accounts.
    public func GetAllAccounts() -> ([String: Any]?, Error?) {
        return Requests.MakeRequest(requestURI: "\(URI)/GetAllAccounts", requestContents: [:]) // Return response
    }
    
    // AccountFromKey attempts to derive an account from a given private key
    public func AccountFromKey(key: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": key] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/AccountFromKey", requestContents: requestContents) // Return response
    }
    
    // PublicKey attempts to derive an ECDSA public key from a given account.
    public func PublicKey(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/PublicKey", requestContents: requestContents) // Return response
    }
    
    // PublicKey attempts to derive an ECDSA private key from a given account.
    public func PrivateKey(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/PrivateKey", requestContents: requestContents) // Return response
    }
    
    // String marshals an account into a JSON-encoded string.
    public func String(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/String", requestContents: requestContents) // Return response
    }
}
