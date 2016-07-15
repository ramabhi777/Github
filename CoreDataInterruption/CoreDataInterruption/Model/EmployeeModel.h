//
//  EmployeeModel.h
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 08/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeModel : NSObject

@property (weak, nonatomic) NSString *name;
@property (weak , nonatomic) NSString *address;
@property NSInteger phoneNumber;
@property NSInteger age;
@property (weak, nonatomic) NSString *emailId;

@end
