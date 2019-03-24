/*:
 # Genesis Block
 
 Unlike many other cryptocurrencies, Polaris does not have a genesis block, as it does not have blocks. Polaris does, however, have a genesis transaction set.
 
 ## Finding the Genesis
 
 Let's try using the skills we learned in the last excercise to find the genesis transaction set, and see what it did to our dag. In this case, we'll make use of the Dag API by initializing a Swift-Polaris instance.
*/

import Foundation
import PlaygroundSupport
import UIKit

var api: API // Init API instance buffer

API.Offline = API.Offline // Just a reminder to set to true for offline capability (make sure to run run_polaris.sh [node needs to be up!])

if API.Offline { // Check is offline
    api = API(apiURI: "https://localhost:8000") // Initialize API instance
} else {
    api = API(apiURI: "https://108.41.124.60:8000") // Initialize API instance
}

/*:
 In order to find the genesis transaction, we'll have to make use of something called the `alloc`. You might have noticed that the resources folder now contains a data/config folder (if you're running a private network). This folder contains a JSON file specifying an `alloc` telling go-polaris where to put the genesis supply. From this alloc, we can find the genesis transaction by querying dag transactions by recipient. To do so, we'll use api.Dag.GetTransactionsByAddress().
*/

let baseView = DemoView(frame: CGRect(x: 0, y: 0, width: 500, height: 500)) // Bg

let genesisTransactionHash = api.Dag.GetTransactionsByAddress(address: "e3891ace0bce06b4acaddcbe47afecdbdcae1fb6").0!["message"] as! String // Get genesis transaction hash

print("found genesis \(genesisTransactionHash)") // Log genesis

baseView.Say(s: "😆🙌 found genesis \(String(genesisTransactionHash.prefix(12)) + "...")") // Display found genesis

PlaygroundPage.current.liveView = baseView // Set live view
PlaygroundPage.current.needsIndefiniteExecution = true // Keep

/*:
 Now, we've found the genesis transaction, but what does it do? Simply put, the genesis transaction forces coins into a particular address without checking for validity. To find the balance of an address pertaining to the genesis, try the following activity: [Genesis Address](Genesis%20Address).
*/
