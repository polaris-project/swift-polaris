/*:
 # Exploring the Dag
 
 To enable easy and efficient verification, the Polaris ledger is kept public and open. Since transactions on Polaris don't have fees, endless information can be stored on the network. Being able to traverse and analyze this information is key to the effective usage of the network.
 
 ## The Dag API
 
 In addition to several other APIs, Swift-Polaris also provides a useful DAG API, that of which contains several methods for traversing, filtering, and querying through the dag.
 
 To get started, let's initialize an instance of the Swift-Polaris API.
*/

import Foundation
import PlaygroundSupport
import UIKit

var api: API // Init API instance buffer

/*:
 * Important:
 - Remember to set API.Offline to enable offline capability. If the assistant view shows a loading indicator, set API.Offline = true.
 - If one wishes for offline capability, make sure a local polaris node is running (chmod +x Resources/run_polaris.sh && Resources/run_polaris.sh)
 */
API.Offline = API.Offline // Just a reminder to set to true for offline capability (make sure to run run_polaris.sh [node needs to be up!])

if API.Offline { // Check is offline
    api = API(apiURI: "https://localhost:8000") // Initialize API instance
} else {
    api = API(apiURI: "https://108.41.124.60:8000") // Initialize API instance
}

/*:
 ## GetBestTransaction
 
 The GetBestTransaction() method is key to the proper function of the Polaris network. Without it, the network would never reach consensus. In our case, GetBestTransaction() should give us the hash of the transaction you published in [Publishing Transactions](Publishing%20Transactions).
*/

let baseView = DemoView(frame: CGRect(x: 0, y: 0, width: 500, height: 500)) // Bg

let bestTransactionHash = api.Dag.GetBestTransaction().0!["message"] as! String // Get best transaction

print("found best transaction with hash \(bestTransactionHash)") // Log best tx

baseView.Say(s: "🔎 found best transaction \(String(bestTransactionHash.prefix(8)) + "...")") // Display best tx

PlaygroundPage.current.liveView = baseView // Set live view
PlaygroundPage.current.needsIndefiniteExecution = true // Keep

/*:
 * Experiment:
 Try [making another transaction](Publishing%20Transactions)!
    - Check back with the assistant editor and see if the best transaction hash has changed. 🕵️‍♀️🤫
 */

/*:
 ## Genesis Block
 
 Although Polaris doesn't have blocks per say, Polaris still has a genesis. In the [next activity](Genesis%20Block), we'll see what the genesis is and what it does.
*/

