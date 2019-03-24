import Foundation

import Foundation

// Class TransactionAPI represents the transaction API.
public class TransactionAPI {
    var URI: String // API lookup path
    
    // init initializes a new TransactionAPI instance.
    init(apiURI: String) {
        URI = "\(apiURI)/twirp/transaction.Transaction" // Set API URI
    }
    
    // NewTransaction intiializes a new transaction with the given params.
    public func NewTransaction(nonce: uint64, amount: Float64, sender: String, recipient: String, parentTransactions: [String], gasLimit: uint64, gasPrice: Int64, payload: String) -> ([String: Any]?, Error?) {
        let requestContents: [String: Any] = ["nonce": nonce, "amount": Data(String(amount).utf8).base64EncodedString(), "address": sender, "address2": recipient, "transactionHash": parentTransactions, "gasLimit": gasLimit, "gasPrice": gasPrice, "payload": Data(payload.utf8).base64EncodedString()] // Initialize request
        
        return Requests.MakeRequest(requestURI: "\(URI)/NewTransaction", requestContents: requestContents) // Return response
    }
}
