import Foundation

import Foundation

// Class TransactionAPI represents the transaction API.
public class TransactionAPI {
    var URI: String // API lookup path
    
    // init initializes a new TransactionAPI instance.
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/transaction.Transaction" // Set API URI
    }
    
    /**
     Initializes a new transaction with the given params.
     
     - parameters:
     - nonce: index of transaction in list of account transactions
     - amount: amount to send
     - sender: sending address
     - recipient: receiving address
     - parentTransactions: list of parent transaction hashes
     - gasLimit: maximum gas willing to spend
     - gasPrice: price per gas unit
    */
    public func NewTransaction(nonce: UInt64, amount: Float64, sender: String, recipient: String, parentTransactions: [String], gasLimit: UInt64, gasPrice: Int64, payload: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["nonce": nonce, "amount": Data("\(amount)".utf8).base64EncodedString(), "address": sender, "address2": recipient, "transactionHash": parentTransactions, "gasLimit": gasLimit, "gasPrice": gasPrice, "payload": Data(payload.utf8).base64EncodedString()] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/NewTransaction", requestContents: requestContents) // Return response
    }
    
    /**
     Calculates the total value of a given transaction.
     
     - parameters:
     - transactionHashes: list of transactions to calculate value for
    */
    public func CalculateTotalValue(transactionHashes: [String]) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": transactionHashes] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/CalculateTotalValue", requestContents: requestContents) // Return response
    }
    
    /**
     Signs a given transaction via ECDSA.
     
     - parameters:
     - transactionHash: transaction to sign
    */
    public func SignTransaction(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/SignTransaction", requestContents: requestContents) // Return response
    }
    
    /**
     Publishes a given transaction.
     
     - parameters:
     - transactionHash: transaction to publish
    */
    public func Publish(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/Publish", requestContents: requestContents) // Return response
    }
    
    /**
     Signs a given message via ECDSA.
     
     - parameters:
     - address: signing address
     - messageHash: hash of message to sign (can be obtained via crypto api)
    */
    public func SignMessage(address: String, messageHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["address": address, "payload": messageHash] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/SignMessage", requestContents: requestContents) // Return response
    }
    
    /**
     Verifies a given transaction's ECDSA signature.
     
     - parameters:
     - transactionHash: transaction to verify
    */
    public func Verify(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/Verify", requestContents: requestContents) // Return response
    }
    
    /**
     Marshals a given transaction to a JSON-encoded string.
     
     - parameters:
     - transactionHash: hash of transaction
    */
    public func String(transactionHash: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["transactionHash": [transactionHash]] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/String", requestContents: requestContents) // Return response
    }
}
