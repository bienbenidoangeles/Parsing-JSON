import Foundation

let json = """
[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    }
]
""".data(using: .utf8)!

//===================
//create models
//===================

struct Location: Codable {
    let title: String
    let locationType: String
    // reminder = once property names are changed using CodingKeys, they must match identically to the case type
    //let location_type: String
    let woeid: Int
    let coordinate: String
    //let latt_long: String
    
    //use coding keys
    
    private enum CodingKeys: String, CodingKey{
        case title
        case locationType = "location_type"
        case woeid
        case coordinate = "latt_long"
    }
}

//===========================
//decode Obj
//=============================
do {
    let array =  try JSONDecoder().decode([Location].self, from: json)
    dump(array)
} catch {
    print("error: \(error)")
}

/*
 ▿ 1 element
 ▿ __lldb_expr_9.Location
   - title: "New York"
   - locationType: "City"
   - woeid: 2459115
   - coordinate: "40.71455,-74.007118"
 */
