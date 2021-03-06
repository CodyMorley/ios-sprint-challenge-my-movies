//
//  CoreDataStack.swift
//  MyMovies
//
//  Created by Cody Morley on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
            var error: Error?
            context.performAndWait {
                do {
                    try context.save()
                } catch let saveError {
                    error = saveError
                }
            }
            if let error = error { throw error }
        }
    

}

