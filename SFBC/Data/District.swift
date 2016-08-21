class District {

    let id: Int
    let name: String
    let phone: String
    let email: String
    let twitter: String

    init(map: [String: AnyObject]) {
        id = Int(map["id"] as! String)!
        name = map["name"] as! String
        phone = map["phone"] as! String
        email = map["email"] as! String
        twitter = map["twitter"] as! String
    }

}
