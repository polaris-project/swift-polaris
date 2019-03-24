import Foundation

// Class AccounstAPI represents the accounts API.
public class AccountsAPI {
    var URI: String // API lookup path
    
    /**
     Initializes a new AccountsAPI instance.
     
     - parameters:
     - apiURI: source API URI
    */
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/accounts.Accounts" // Set API URI
    }
    
    /**
     Initializes a new account via the provided API lookup URI.
    */
    public func NewAccount() -> ([String: Any]?, Error?) {
        return Requests.MakeRequest(requestURI: "\(URI)/NewAccount", requestContents: [:]) // Return response
    }
    
    /**
     Fetches a list of working accounts.
    */
    public func GetAllAccounts() -> ([String: Any]?, Error?) {
        return Requests.MakeRequest(requestURI: "\(URI)/GetAllAccounts", requestContents: [:]) // Return response
    }
    
    /**
     Derives an account from a given private key.

     - parameters:
     - key: source private key (hex encoded)
    */
    public func AccountFromKey(key: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": key] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/AccountFromKey", requestContents: requestContents) // Return response
    }
    
    /**
     Derives an ECDSA public key from a given account.
     
     - parameters:
     - address: address of account to fetch key from
    */
    public func PublicKey(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/PublicKey", requestContents: requestContents) // Return response
    }
    
    /**
     Derives an ECDSA private key from a given account.
     
     - parameters:
     - address: address of account to fetch key from
    */
    public func PrivateKey(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/PrivateKey", requestContents: requestContents) // Return response
    }
    
    /**
     Marshals an account into a JSON-encoded string.
     
     - parameters:
     - address: account to marshal
    */
    public func String(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["privatePublicKey": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/String", requestContents: requestContents) // Return response
    }
}
