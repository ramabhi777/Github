//
//  OperationManager.m
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 10/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import "OperationManager.h"

@implementation OperationManager

-(void)main
{
    @autoreleasepool {
        [self dataBaseOperations];
    }
}

-(void)dataBaseOperations
{
    for (int i=0; i<self.employeeList.count; i++) {
        [DBManager insertIntoDB:[self getManagedObectContext] withEmployeeObject:[self.employeeList objectAtIndex:i]];
    }
    
    [DBManager retrieveEmployeeListFromDB:[self getManagedObectContext]];
}


-(NSManagedObjectContext *)getManagedObectContext
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObjectContext *context = [appDelegate newPrivateContext];
    return context;
}

@end
