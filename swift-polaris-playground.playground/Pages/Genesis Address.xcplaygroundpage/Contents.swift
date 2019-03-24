/*:
 # Genesis Address
 
 To find the genesis address, let's initialize a new Swift-Polaris instance.
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
 As we've found earlier, the dag API can help us analyze data on the ledger. As a party of "data analysis", we can calculate the balance of a particular address. Let's do it with the genesis.
 */

let baseView = DemoView(frame: CGRect(x: 0, y: 0, width: 500, height: 500)) // Bg

let genesisBalance = api.Dag.CalculateAddressBalance(address: "e3891ace0bce06b4acaddcbe47afecdbdcae1fb6").0!["message"] as! String // Get genesis transaction hash

print("found genesis balance \(genesisBalance)") // Log genesis

baseView.Say(s: "💸 found genesis balance: \(genesisBalance)") // Display found balance

PlaygroundPage.current.liveView = baseView // Set live view
PlaygroundPage.current.needsIndefiniteExecution = true // Keep
