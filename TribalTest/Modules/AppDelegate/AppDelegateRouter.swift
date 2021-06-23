
import Foundation
import UIKit

/** Router of the AppDelegate Module set, UIKit Dependent*/
final class AppDelegateRouter:ViperRouterUIKit,AppDelegateRouterProtocol{
    func route(to r: AppDelegateRoutes){
        go { (current) -> (UIViewController) in
            switch r{
            case .main:
                let main = MainModule().default()
                let favorites = FavoritesModule().default()
                let tab = CustomTabBarView.init()
                
                let mainTab = UITabBarItem(title: "Inicio", image: UIImage(named: "tabHome"), selectedImage: UIImage(named: "tabHomeSelected"))
                main.tabBarItem = mainTab
                let favTab = UITabBarItem(title: "Favoritos", image: UIImage(named: "tabFavorites"), selectedImage: UIImage(named: "tabFavoritesSelected"))
                favorites.tabBarItem = favTab
                
                tab.viewControllers = [
                    CustomNavBarView.init(rootViewController: main),
                    CustomNavBarView.init(rootViewController: favorites)
                ]
                
                return tab
            /*case .main:
                let vc = CustomNavBarView.init(rootViewController: MainModule().default())
                return vc*/
            }
            return .init()
        }
    }
}
