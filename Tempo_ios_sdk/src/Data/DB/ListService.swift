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
        //return presObj
    }
     /*
    internal static func searchCamera(managedObjectContext:NSManagedObjectContext, id_camera: String) -> NSFetchedResultsController<PG_Camera> {
        let fetchedResultController: NSFetchedResultsController<PG_Camera>
        
        let request: NSFetchRequest<PG_Camera> = PG_Camera.fetchRequest()
        let sort = NSSortDescriptor(key: "id_camera", ascending: true)
        let predicate = NSPredicate(format: "id_camera = %@", id_camera)
        
        request.sortDescriptors = [sort]
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
   
    internal static func createCamera(coreDate: CoreDataStack, camera: CameraDTO) -> PG_Camera{
        let idSearch = ListService.searchCamera(managedObjectContext: coreDate.persistentContainer.viewContext, id_camera: camera.id_camera)
        var presObj : PG_Camera
        if(idSearch.fetchedObjects?.count != 0){
            presObj = (idSearch.fetchedObjects?.last)!
            presObj.id_camera = camera.id_camera
        }else{
            presObj = PG_Camera(context: coreDate.persistentContainer.viewContext)
        }
        presObj.direction = camera.direction
        presObj.href = camera.href
        presObj.region = camera.region
        presObj.title = camera.title
        presObj.view = camera.view
        presObj.latitude = Float(camera.latitude)
        presObj.logitude = Float(camera.logitude)
        
        coreDate.saveContext()
        return presObj
    }
    
    internal static func createListCamera(coreData: CoreDataStack, array: [CameraDTO]) -> [PG_Camera]{
        var list = [PG_Camera]()
        for camera in array{
            list.append(createCamera(coreDate: coreData, camera: camera))
        }
        return list
    }
    
    internal static func checkListCamera(for offset: String, sendSuccessCompletion: @escaping Constants.HttpManager.httpSuccessCompletion, failureCompletion: @escaping Constants.HttpManager.httpFailureCompletion) {
        
        let url = Constants.ExternalURLs.general
        let urlOffset = "\(url)\(offset)"

        //print("Downloading list from: \(urlOffset)")
        
        Alamofire.request(urlOffset).responseObject { (data: DataResponse<CameraListRowsDTO>) in
            let statusCode = data.response?.statusCode
            
            if statusCode == 200 {
                let rows : CameraListRowsDTO = data.result.value!
                sendSuccessCompletion(rows.rows)
                
            }else{
                failureCompletion("Error", statusCode!)
            }
        }
    }
 */
}
