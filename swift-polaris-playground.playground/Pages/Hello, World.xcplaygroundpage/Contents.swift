/*:
 # The API

 Interacting with Polaris via Polaris-Swift is easy! Simply initialize a new API instance with a providing URI.
    In this case, I'm initializing a new API instance with the URI for my Raspberry Pi's Go-Polaris RPC API.
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
 ## The Accounts API
 
 When an API instance is created, so are instances of each package API. To access the accounts API, use api.Accounts.
 
 ### Creating a New Account
 
 Like a few other methods in the Accounts API, NewAccount() does not take any parameters. Simply call api.Accounts.NewAccount() to generate a new ECDSA private key and public key, as well as a Polaris address (derived from the Sha3 hash of the public key). Like every other API method, NewAccount() will return a JSON dict representing the response from the node, and an error (if applicable).
*/

let newAccountResponse = api.Accounts.NewAccount() // Initialize new account

let newAccountAddress = newAccountResponse.0!["message"] as! String // Your new account address!

print("Created new account successfully! Here's your address: \(newAccountAddress)") // Log new account

/*:
 * Callout(Forgot Your Address?):
 Use api.Accounts.GetAllAccounts() to get a list of all the accounts created on the local node.
*/

let baseView = DemoView(frame: CGRect(x: 0, y: 0, width: 500, height: 500)) // Placeholder to present address
baseView.Say(s: "👏 Here's Your Address: \(String(newAccountAddress.prefix(16)) + "...")") // Set text to addr

PlaygroundPage.current.liveView = baseView // Set live view
PlaygroundPage.current.needsIndefiniteExecution = true // Keep open

//: Read to [make your first transaction?](Transaction)
