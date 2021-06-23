
import Foundation

fileprivate let bundle = "vpos"

fileprivate var asFastAsUIQueue = DispatchQueue.init(label: "q1-\(bundle)", qos: .userInteractive, attributes: .concurrent, target: DispatchQueue.global())
fileprivate var userMightWaitQueue = DispatchQueue.init(label: "q2-\(bundle)", qos: .userInitiated, attributes: .concurrent, target: DispatchQueue.global())
fileprivate var backgroundExecuted = DispatchQueue.init(label: "b-\(bundle)", qos: .background, attributes: .concurrent, target: DispatchQueue.global())

///Hilo principal, solo para codigo de view
func m (after deadline:DispatchTime = .now(), _ callback:@escaping()->()){
    DispatchQueue.main.asyncAfter(deadline: deadline, execute: callback)
}

///Interacciones inmediatas, no se tolera esperar
func q1(after deadline:DispatchTime = .now(), _ callback:@escaping()->()){
    asFastAsUIQueue.asyncAfter(deadline: deadline, execute: callback)
}

///Interaccion del usuario, se requiere esperar
func q2(after deadline:DispatchTime = .now(), _ callback:@escaping()->()){
    userMightWaitQueue.asyncAfter(deadline: deadline, execute: callback)
}

///Elemento pasivo, se puede ejecutar momentaneamente
func b(after deadline:DispatchTime = .now(), _ callback:@escaping()->()){
    backgroundExecuted.asyncAfter(deadline: deadline, execute: callback)
}

var q1: DispatchQueue{
    return asFastAsUIQueue
}

var q2: DispatchQueue{
    return userMightWaitQueue
}

var b: DispatchQueue{
    return backgroundExecuted
}
