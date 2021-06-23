
import Foundation

// - MARK: Contract

protocol AppDelegateInteractorProtocol{

}

protocol AppDelegateRouterProtocol{
    mutating func route(to:AppDelegateRoutes)
}

// - MARK: Contract Enums

enum AppDelegateRoutes{
    //case login
    case main
    //case reset(t: String)
}
