/*:
 # The Transaction API
 
 Just like the Accounts API, the Transaction API is a child property of the API class. Initialize one to access the Transaction API.
 */

import Foundation
import UIKit
import PlaygroundSupport

var api: API // Init API instance buffer

API.Offline = API.Offline // Just a reminder to set to true for offline capability (make sure to run run_polaris.sh [node needs to be up!])

if API.Offline { // Check is offline
    api = API(apiURI: "https://localhost:8000") // Initialize API instance
} else {
    api = API(apiURI: "https://108.41.124.60:8000") // Initialize API instance
}

/*:
 ## Crafting a New Transaction
 
 Unlike creating a new account, creating a transaction does take a few parameters. First and foremost, the NewTransaction() method takes a nonce. A nonce is essentially the index of the transaction in the list of account transactions (prevent replay attacks). Secondly, a transaction takes an amount. For now, we'll go with 0. Furthermore, NewTransaction then takes a sender and recipient. Again, because I'll assume you're on your own private network, we'll just set it to your address. After the recipient and sender, you'll have to provide the parent hash. This can be easily found via the dag API's GetBestTransaction() method. Finally, the tx will take a gasPrice, gasLimit, and payload. A gasPrice is essentially how much you're willing to pay per gas unit. The gasLimit is how much of that unit you're willing to pay. The payload is essentially just a message you want to pass with the transaction.
*/

/*:
 * Experiment:
 Try creating a new transaction via the parameters below.
 
    - Set a message in the variable below (everyone connected to the network will see it [if on public net])!
    - Set a new destination address (or just leave it [sends to your address by default])
*/

let newAccountAddress = api.Accounts.NewAccount().0!["message"] as! String // Initialize new account
let lastTransactionHash = api.Dag.GetBestTransaction().0!["message"] as! String // Get last tx

/* Change these two as you wish */

var destination = newAccountAddress // Try changing
var message = "your message" // Try changing

let baseView = DemoView(frame: CGRect(x: 0, y: 0, width: 500, height: 500)) // Bg

if message == "your message" { // Check still default message
    baseView.Say(s: "Hint: change the message variable (line 41)!") // Log should try changing message
} else {
    var transactionHash = api.Transaction.NewTransaction(nonce: 0, amount: 0, sender: newAccountAddress, recipient: destination, parentTransactions: [lastTransactionHash], gasLimit: 0, gasPrice: 0, payload: message).0!["message"] as! String // Initialize transaction
    
    transactionHash = api.Transaction.SignTransaction(transactionHash: transactionHash).0!["message"] as! String // Sign transaction
    api.Transaction.Publish(transactionHash: transactionHash) // Publish
    
    baseView.Say(s: "😼🎉 transaction \(String(transactionHash.prefix(8)) + "...") published!") // Log publish!
}

/*:
 * Experiment:
 Once you see a "transaction published!" message in the assistant, check the terminal you're running go-polaris in (if you're running offline, of course)!
    - Notice the different types of logs relating to the hash in the assistant editor
    - If you're connected to the public network, you might notice other peers requesting for your new transaction's contents! 👀
*/

PlaygroundPage.current.liveView = baseView // Set live view
PlaygroundPage.current.needsIndefiniteExecution = true // Keep open

/*:
 ## Another Excercise
 
 Now that you've mastered creating, signing, and publishing transactions, let's try exploring the DAG. If you're on a private network, you'll likely only have two transactions in the dag, but on a public network, all kinds of information can be found on the DAG (including messages from other people). Learn how the Swift-Polaris DAG API lets users [explore the Polaris ledger](Exploring%20the%20Dag).
*/
