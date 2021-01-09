//
//  DynamicValue.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//


import Foundation

public typealias CompletionHandler = (() -> Void)
public class DynamicValue<T> {
    
 
    
  public  var value : T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    init(_ value: T,noInterNetAccess:Bool) {
        self.value = value
    }
    
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value() })
    }
    
    deinit {
        observers.removeAll()
    }
}


