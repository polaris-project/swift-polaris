import Foundation

// Class API defines the swift-polaris API.
public class API {
    var URI: String // API lookup path
    
    public var Accounts: AccountsAPI // Accounts API instance
    public var Transaction: TransactionAPI // Transaction API instance
    
    // init initializes a new API instance with the given api URI.
    public init(apiURI: String) {
        URI = apiURI // Set URI
        
        Accounts = AccountsAPI(apiURI: apiURI) // Initialize accounts API
        Transaction = TransactionAPI(apiURI: apiURI) // Initialize transaction API
    }
}
