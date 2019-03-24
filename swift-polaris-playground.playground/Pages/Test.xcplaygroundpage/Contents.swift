//: [Previous](@previous)

import Foundation

var api = API(apiURI: "https://108.41.124.60:8000") // Initialize API instance

var account1 = api.Accounts.NewAccount() // Iniailize account
var transactionHash = api.Transaction.NewTransaction(nonce: 0, amount: 10, sender: account1.0!["message"] as! String, recipient: account1.0!["message"] as Any as! String, parentTransactions: ["test"], gasLimit: 0, gasPrice: 0, payload: "test") // Initialize tx

print(transactionHash)


//: [Next](@next)
