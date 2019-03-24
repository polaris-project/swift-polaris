/*:
 # Genesis Address
 
 To find the genesis address, let's initialize a new Swift-Polaris instance.
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
API.Offline = true // Just a reminder to set to true for offline capability (make sure to run run_polaris.sh [node needs to be up!])

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

/*:
 ## That's All!
 
 Thanks for checking out my playground! Once again, feel free to play around with the Go-Polaris terminal (go-polaris --terminal), or the Swift-Polaris API. And, on that note, check out the [Go Polaris implementation repository](https://github.com/polaris-project/go-polaris) for further updates from myself regarding the protocol.
*/
