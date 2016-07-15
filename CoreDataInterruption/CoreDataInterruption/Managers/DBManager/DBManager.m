//
//  DBManager.m
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 08/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import "DBManager.h"
#define EmployeeEntity @"Employee"

@implementation DBManager

+(void)insertIntoDB : (NSManagedObjectContext *)context withEmployeeObject:(EmployeeModel *)employeeModel
{
    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:EmployeeEntity inManagedObjectContext:context];
    [managedObject setValue:employeeModel.name forKey:@"name"];
    [managedObject setValue:employeeModel.address forKey:@"address"];
    [managedObject setValue:[NSNumber numberWithInteger:employeeModel.phoneNumber] forKey:@"phoneNumber"];
    [managedObject setValue:employeeModel.emailId forKey:@"emailId"];
    NSError *error;
    if (![context save:&error])
    {
        NSLog(@"Problem saving: %@", [error localizedDescription]);
    }
}

+(NSMutableArray *) retrieveEmployeeListFromDB:(NSManagedObjectContext *)context
{
    NSMutableArray *employeeList;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:EmployeeEntity];
    [fetchRequest setFetchLimit:1000];
    NSError *error;
    NSArray *fetchedArray = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedArray)
    {
        employeeList = [[NSMutableArray alloc] initWithArray:fetchedArray];
    }
    return employeeList;
}

+(void)deleteRecordFromDB:(NSManagedObjectContext *)context withListOfEmployee:(NSMutableArray *)employeeList
{
    for (Employee *employee in employeeList)
    {
        [context deleteObject:employee];
    }
    NSError *error;
    [context save:&error];
    if (![context save:&error])
    {
        NSLog(@"Problem saving: %@", [error localizedDescription]);
    }
}

@end
