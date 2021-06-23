import Foundation

class ServiceLocator {
    
    static func imageService() -> ImageService{
        return APIImageService()
    }
    
    static func coreDataService() -> CoreDataService{
        return APICoreDataService()
    }
    
}
