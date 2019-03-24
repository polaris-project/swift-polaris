import Foundation

import Foundation

// Class TransactionAPI represents the transaction API.
public class TransactionAPI {
    var URI: String // API lookup path
    
    // init initializes a new TransactionAPI instance.
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/transaction.Transaction" // Set API URI
    }
    
    // NewTransaction initializes a new transaction with the given params.
    public func NewTransaction(nonce: uint64, amount: Float64, sender: String, recipient: String, parentTransactions: [String], gasLimit: uint64, gasPrice: Int64, payload: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["nonce": nonce, "amount": Data("\(amount)".utf8).base64EncodedString(), "address": sender, "address2": recipient, "transactionHash": parentTransactions, "gasLimit": gasLimit, "gasPrice": gasPrice, "payload": Data(payload.utf8).base64EncodedString()] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/NewTransaction", requestContents: requestContents) // Return response
    }
    
    // CalculateTotalValue calculates the total value of a given transaction.
    public func CalculateTotalValue(transactionHashes: [String]) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": transactionHashes] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/CalculateTotalValue", requestContents: requestContents) // Return response
    }
    
    // SignTransaction signs a given transaction via ECDSA.
    public func SignTransaction(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/SignTransaction", requestContents: requestContents) // Return response
    }
    
    // Publish publishes a given transaction.
    public func Publish(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/Publish", requestContents: requestContents) // Return response
    }
    
    // SignMessage signs a given message via ECDSA.
    public func SignMessage(address: String, messageHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["address": address, "payload": messageHash] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/SignMessage", requestContents: requestContents) // Return response
    }
    
    // Verify verifies the validity of a given transaction's ECDSA signature.
    public func Verify(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/Verify", requestContents: requestContents) // Return response
    }
    
    // String marshals a given transaction to a JSON-encoded string.
    public func String(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/String", requestContents: requestContents) // Return response
    }
}
