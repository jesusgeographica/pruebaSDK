//
//  CoreDataStack.swift
//  Jesus Victorio
//
//  Created by Jesus Victorio on 21/12/2017.
//  Copyright © 2017 Jesus Victorio. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let frameworkBundle = Bundle(for: FloorView.self)
        //let container = NSPersistentContainer(name: "Model")
        let container = NSPersistentContainer.init(name: "Model", bundle: frameworkBundle)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
