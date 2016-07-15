//
//  EmployeeTableViewCell.h
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 08/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblEmpName;
@property (weak, nonatomic) IBOutlet UILabel *lblEmpAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblEmpPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblEmpEmailId;


@end
