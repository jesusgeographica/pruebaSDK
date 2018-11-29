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
    /*
    public static func getCenter(managedObjectContext:NSManagedObjectContext) -> NSFetchedResultsController<Center> {
        let fetchedResultController: NSFetchedResultsController<Center>
        
        let request: NSFetchRequest<Center> = PG_Camera.fetchRequest()
        let sort = NSSortDescriptor(key: "center_id", ascending: true)
        request.sortDescriptors = [sort]
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchedResultController.performFetch()
        }
        catch {
            fatalError("Error in fetching records")
        }
        
        return fetchedResultController
    }
     
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
