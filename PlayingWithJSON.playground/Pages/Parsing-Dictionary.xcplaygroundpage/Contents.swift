//Parsing Dictionary

import Foundation

let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

//=========================================================
//Create Model(s)
//=========================================================

//Codable: Decodable & Encodable

//Decodable: converst JSON Data
//Encodable: converts to json data to e.g. POST to a web API

struct ResultsWrapper: Codable {
    let results: [Contact]
}

struct Contact: Codable {
    let firstName: String
    let lastName: String
}

//=======================================================
// DECODE the JSON Data to our swift model
//=======================================================

do {
    let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json)
    let contacts = dictionary.results
    dump(contacts)
} catch {
    print("decoding error: \(error)")
}
