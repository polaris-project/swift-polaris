//: [Previous](@previous)

import Foundation

var api = API(apiURI: "https://108.41.124.60:8000") // Initialize API instance

var test = api.Accounts.NewAccount() // Initialize Polaris account

print(test) // Log account

//: [Next](@next)
