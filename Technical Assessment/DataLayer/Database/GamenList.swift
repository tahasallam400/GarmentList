//
//  GamenList.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import Foundation
import CoreData

extension GamenList{
 
    class public func add(name:String,Date:Date){
          if !isNameExistBefore(name: name){
              if let entityDescription = NSEntityDescription.entity(forEntityName: "GamenList", in: managedContext){
                let languageObject = GamenList(entity: entityDescription, insertInto: managedContext)
                languageObject.name = name
                languageObject.creationDate = Date
                do{
                    try managedContext.save()
                }catch{
                }
            }
         }
                  
        }
    
       class public func isNameExistBefore(name:String)->Bool{
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GamenList")
            fetch.predicate = NSPredicate(format:" name == %@",name)
            do{
                 let list =  try managedContext.fetch(fetch) as? [GamenList]
                return (list?.count ?? 0) > 0
                
            }catch{
            }
            return false
       }
    
    
    class public func sortedByalphabetical()-> [GamenList]?{
      
         return list(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    }
    
    class public func sortedByDate()-> [GamenList]?{
         return list(sortDescriptors: [NSSortDescriptor(key: "creationDate", ascending: true)])
    }
    
    class public func list(sortDescriptors: [NSSortDescriptor]? = nil) -> [GamenList]?{
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GamenList")
            
            fetch.sortDescriptors = sortDescriptors
            do{
                if let list =  try managedContext.fetch(fetch) as? [GamenList]{
                   return list
                }
            }catch{
            }
            return nil
    }
    
   class public func deleteAllData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GamenList")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try managedContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                managedContext.delete(objectData)
            }
        } catch let error {
            print("Detele all data in GamenList error :", error)
        }
    }
}

