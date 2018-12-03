//
//  UserService.swift
//  MiPrescripcion
//
//  Created by Jesús Victorio Martin on 2/1/18.
//  Copyright © 2018 Babel. All rights reserved.
//

import UIKit
import CoreData

public class ListService {
    
    public static func getCenter(managedObjectContext:NSManagedObjectContext, code: String) -> NSFetchedResultsController<Center> {
        let fetchedResultController: NSFetchedResultsController<Center>
        
        let request: NSFetchRequest<Center> = Center.fetchRequest()
        let sort = NSSortDescriptor(key: "center_id", ascending: true)
        request.sortDescriptors = [sort]
        
        let predicate = NSPredicate(format: "center_id = %@", code)
        request.predicate = predicate
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchedResultController.performFetch()
        }
        catch {
            fatalError("Error in fetching records")
        }
        
        return fetchedResultController
    }
    
    internal static func createCenter(coreDate: CoreDataStack, center: ECICenter){
        let idSearch = ListService.getCenter(managedObjectContext: coreDate.persistentContainer.viewContext, code: center.code)
        var presObj : Center
        if(idSearch.fetchedObjects?.count != 0){
            presObj = (idSearch.fetchedObjects?.last)!
            presObj.center_id = center.code
        }else{
            presObj = Center(context: coreDate.persistentContainer.viewContext)
        }
        
        presObj.name = center.centre_name
        presObj.lat = (center.centroid_geojson?.coordinates.last)!
        presObj.lng = (center.centroid_geojson?.coordinates.first)!
        presObj.center_id = center.code
        presObj.default_floor = center.default_floor
        presObj.floors = center.getFloors()
        
        coreDate.saveContext()
    }
}
