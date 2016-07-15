//
//  OperationManager.h
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 10/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"
@interface OperationManager : NSOperation

@property (strong, nonatomic) NSMutableArray *employeeList;

@end
