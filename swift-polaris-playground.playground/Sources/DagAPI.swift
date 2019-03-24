import Foundation

// Class DagAPI represents the dag API.
public class DagAPI {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/dag.Dag" // Set API URI
    }
    
    /**
     Initializes a new dag via the provided API lookup URI.
     
     - parameters:
     - network: name of network to initialize
    */
    public func NewDag(network: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network] // Initialize request

        return Requests.MakeRequest(requestURI: "\(URI)/NewDag", requestContents: requestContents) // Return response
    }
    
    /**
     Makes the genesis transaction set for the working network.
    */
    public func MakeGenesis() -> ([String: Any]?, Error?) {
        return Requests.MakeRequest(requestURI: "\(URI)/MakeGenesis", requestContents: [:]) // Return response
    }
    
    /**
     Queries a transaction by a given hash.
     
     - parameters:
     - transactionHash: hash to query
    */
    public func GetTransactionByHash(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": transactionHash] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionByHash", requestContents: requestContents) // Return response
    }
    
    /**
     Queries the children of a given transaction.
     
     - parameters:
     - transactionHash: parent hash to query children from
    */
    public func GetTransactionChildren(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": transactionHash] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionChildren", requestContents: requestContents) // Return response
    }
    
    /**
     Queries all transactions relevant to a given address.
     
     - parameters:
     - address: sending/receiving address
    */
    public func GetTransactionsByAddress(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["address": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionsByAddress", requestContents: requestContents) // Return response
    }
    
    /**
     Queries all transactions sent by a given address.
     
     - parameters:
     - address: sending address
    */
    public func GetTransactionsBySender(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["address": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionsBySender", requestContents: requestContents) // Return response
    }
    
    /**
     Determines the best transaction in the working dag.
    */
    public func GetBestTransaction() -> ([String: Any]?, Error?) {
        return Requests.MakeRequest(requestURI: "\(URI)/GetBestTransaction", requestContents: [:]) // Return response
    }
    
    /**
     Calculates the balance of a given address.
     
     - parameters:
     - address: address balance to calculate
    */
    public func CalculateAddressBalance(address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["address": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/CalculateAddressBalance", requestContents: requestContents) // Return response
    }
}
