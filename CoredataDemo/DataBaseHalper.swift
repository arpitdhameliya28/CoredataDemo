//        
//  DataBaseHalper.swift
//  CoredataDemo
//
//  Created by Arpit Dhameliya on 2/29/24.
//

import UIKit
import CoreData

class DataBaseHalper {

    static let sherd = DataBaseHalper()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoredataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - SetData
    
    func setData(name : String,number : String) {
        
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Savedata", into: context) as! Savedata
        
        entity.name = name
        entity.number = number
        
        do {
            try context.save()
        } catch {}
    }
    
    // MARK: - GetData(Fetch)
    
    func getData() -> [Savedata]{
        
        let context = persistentContainer.viewContext
        var request = [Savedata]()
        
        do {
            request = try context.fetch(Savedata.fetchRequest())
        } catch let error {
            print(error.localizedDescription)
        }
        return request
    }
    
    
    // MARK: - DeleteData
    
    func deletedata(id: Int) {
        let context = persistentContainer.viewContext
        do {
            let data = try context.fetch(Savedata.fetchRequest()) as? [Savedata]
            for i in data ?? [] {
                if i.id == Int16(id) {
                    context.delete(i)
                }
            }
            try context.save()
        } catch {}
    }
}



