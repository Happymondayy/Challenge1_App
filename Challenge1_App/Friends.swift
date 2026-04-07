import Foundation

struct Friend: Identifiable{
    let id = UUID()
    let initial: String
    let nickname: String
    let interest: String
    let location: String
    let bio: String
}
