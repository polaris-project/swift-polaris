import Foundation

// Class API defines the swift-polaris API.
public class API {
    public static var Offline: Bool = false // Init offline buffer

    var URI: String // API lookup path
    
    public var Accounts: AccountsAPI // Accounts API instance
    public var Transaction: TransactionAPI // Transaction API instance
    public var Dag: DagAPI // Dag API instance
    
    // init initializes a new API instance with the given api URI.
    public init(apiURI: String) {
        URI = apiURI // Set URI
        
        Accounts = AccountsAPI(apiURI: apiURI) // Initialize accounts API
        Transaction = TransactionAPI(apiURI: apiURI) // Initialize transaction API
        Dag = DagAPI(apiURI: apiURI) // Initialize dag API
    }
}
