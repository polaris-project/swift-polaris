import Foundation

// Class DagAPI represents the dag API.
public class DagAPI {
    var URI: String // API lookup path
    
    // init initializes a new AccountsAPI instance.
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/dag.Dag" // Set API URI
    }
    
    // NewDag initializes a new dag via the provided API lookup URI.
    public func NewDag(network: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network] // Initialize request

        return Requests.MakeRequest(requestURI: "\(URI)/NewDag", requestContents: requestContents) // Return response
    }
    
    // MakeGenesis makes the genesis transaction set for a given network.
    public func MakeGenesis(network: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/MakeGenesis", requestContents: requestContents) // Return response
    }
    
    // GetTransactionByHash attempts to query a transaction by a given hash.
    public func GetTransactionByHash(network: String, transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network, "transactionHash": transactionHash] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionByHash", requestContents: requestContents) // Return response
    }
    
    // GetTransactionChildren attempts to query the children of a given transaction.
    public func GetTransactionChildren(network: String, transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network, "transactionHash": transactionHash] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionChildren", requestContents: requestContents) // Return response
    }
    
    // GetTransactionsByAddress attempts to query all transactions relevant to a given address.
    public func GetTransactionsByAddress(network: String, address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network, "address": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionsByAddress", requestContents: requestContents) // Return response
    }
    
    // GetTransactionsBySender attempts to query all transactions sent by a given address.
    public func GetTransactionsBySender(network: String, address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network, "address": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetTransactionsBySender", requestContents: requestContents) // Return response
    }
    
    // GetBestTransaction attempts to determine the best transaction in the working dag.
    public func GetBestTransaction(network: String, address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/GetBestTransaction", requestContents: requestContents) // Return response
    }
    
    // CalculateAddressBalance attempts to calculate the balance of a given address.
    public func CalculateAddressBalance(network: String, address: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["network": network, "address": address] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/CalculateAddressBalance", requestContents: requestContents) // Return response
    }
}
