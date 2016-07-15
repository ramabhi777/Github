//
//  DBManager.h
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 08/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmployeeModel.h"
#import "AppDelegate.h"
#import "Employee.h"
@interface DBManager : NSObject

+(void)insertIntoDB : (NSManagedObjectContext *)context withEmployeeObject:(EmployeeModel *)employeeModel;
+(NSMutableArray *) retrieveEmployeeListFromDB:(NSManagedObjectContext *)context;
+(void)deleteRecordFromDB:(NSManagedObjectContext *)context withListOfEmployee:(NSMutableArray *)employeeList;


@end
