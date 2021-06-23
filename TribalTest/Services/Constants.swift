import UIKit

// MARK: Enviroment Constants
//#if STAGE
let API_BASE_URL = "https://api.unsplash.com/"
let ACCESS_KEY = "u_vz47SxO3-U5NWO3593q0uwMBESvJTlL8n4VXuGfeo"
let SECRET_KEY = "g-3RMTQ7_WtG2yb_xoq7Yf3J18kMTvukZXwo1xWhoRQ"
//let STRIPE_PUBLIC_KEY = "pk_test_SYmUBvKZbElyiSRokydSNoJJ00Hjziuqae"
//#else
//let API_BASE_URL = "http://167.99.164.22/api/"
//let BASE_URL = "http://167.99.164.22/"
//#endif

enum Refresh{
    case pull
    case scroll
}
enum DataAction{
    case replace
    case add
}
//MARK: Strings
