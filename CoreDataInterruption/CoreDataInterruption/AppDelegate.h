//
//  AppDelegate.h
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 08/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSManagedObjectContext*)newPrivateContext;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

