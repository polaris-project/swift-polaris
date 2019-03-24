//: [Previous](@previous)

import Foundation

var api = API(apiURI: "https://108.41.124.60:8000") // Initialize API instance

var accounts = api.Accounts.GetAllAccounts() // Get all accounts

print(accounts)

//: [Next](@next)
