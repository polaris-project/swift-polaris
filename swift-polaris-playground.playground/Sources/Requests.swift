import Foundation

// Class Requests implements a set of http request helper methods.
class Requests: NSObject, URLSessionDelegate {
    // MakeRequest makes a synchronous request at a given URI, with a given set of JSON contents.
    public static func MakeRequest(requestURI: String, requestContents: [String: Any]) -> ([String: Any]?, Error?) {
        let jsonData = try? JSONSerialization.data(withJSONObject: requestContents) // Get JSON representation
        
        var request = URLRequest(url: URL(string: requestURI)!) // Craft request

        request.httpMethod = "post" // Set HTTP method
        request.httpBody = jsonData // Set request body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Set content type
        
        var responseJSON: [String: Any]? = nil // Init response buffer
        
        var err: Error? = nil // Init error buffer
        
        let sem = DispatchSemaphore(value: 0) // Create sync buffer
        
        let task = URLSession(configuration: URLSessionConfiguration.default, delegate: Requests(), delegateQueue: OperationQueue.init()).dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { // Check for errors
                err = error! // Set error
        
                return // Return
            }
        
            responseJSON = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any] // Set response JSON
        
            sem.signal() // Dispatch signal
        }
        
        task.resume() // Start task
        
        sem.wait() // Wait for finish
        
        return (responseJSON, err) // Return response
    }
    
    // urlSession forces a self-signed TLS cert.
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!)) // Use credential
    }
}
