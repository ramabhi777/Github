//
//  ViewController.m
//  CoreDataInterruption
//
//  Created by Abhishek Shukla on 08/03/16.
//  Copyright © 2016 InnovationM. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeTableViewCell.h"
#import "EmployeeModel.h"
#define APP_DELEGATE [UIApplication sharedApplication].delegate

NSString *employeeCellIdentifier = @"EmployeeTableCellIdentifier";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UILabel *lblEmployeeCount;

@end

@implementation ViewController
{
    NSMutableArray *employeeList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeObject];
    [self initializeView];
}

-(void)initializeObject
{
    employeeList = [[NSMutableArray alloc] init];
    employeeList = [self fetchEmployeeListFromDB];
    [self.tblView reloadData];
    self.lblEmployeeCount.text = [NSString stringWithFormat:@"%ld", [employeeList count]];
    [self scrollToBottom];
    [self excuteOperationForInterruption];
}

-(void)initializeView
{
    self.navigationItem.title = @"Employee Details";
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteAction:)];
    self.navigationItem.rightBarButtonItem = deleteButton;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
    self.navigationItem.leftBarButtonItem = addButton;
}

-(IBAction)addAction:(id)sender
{
    [self prepareEmployeeObject];
    [self initializeObject];
}

-(IBAction)deleteAction:(id)sender
{
    [self removeEmployeeFromList:employeeList];
    employeeList = [self fetchEmployeeListFromDB];
    [self.tblView reloadData];
    self.lblEmployeeCount.text = [NSString stringWithFormat:@"%ld", [employeeList count]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [employeeList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EmployeeTableViewCell *employeeCell = [self.tblView dequeueReusableCellWithIdentifier:employeeCellIdentifier];
    EmployeeModel *employeeModel = [employeeList objectAtIndex:indexPath.row];
    employeeCell.lblEmpName.text = employeeModel.name;
    employeeCell.lblEmpAddress.text = employeeModel.address;
//    NSString *phoneNumberString = [NSString stringWithFormat:@"%ld", employeeModel.phoneNumber];
//    employeeCell.lblEmpPhoneNumber.text = phoneNumberString;
    employeeCell.lblEmpEmailId.text = employeeModel.emailId;
    
    return employeeCell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        EmployeeModel *employeeModelToDelete = [employeeList objectAtIndex:indexPath.row];
        NSMutableArray *employeeListToDelete = [[NSMutableArray alloc] initWithObjects:employeeModelToDelete, nil];
        [self removeEmployeeFromList:employeeListToDelete];
        [employeeList removeObjectAtIndex:indexPath.row];
        [self.tblView reloadData];
        self.lblEmployeeCount.text = [NSString stringWithFormat:@"%ld", [employeeList count]];
        [self scrollToBottom];
    }
}

#pragma mark - TableView Delegate
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(void)prepareEmployeeObject
{
    EmployeeModel *employeeModelPrepared;
    for (int i=0; i<10; i++)
    {
        switch (i) {
            case 0:
                 employeeModelPrepared = [self initializeEmployeeObject:@"Abhishek" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"abhishek.shukla@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
                
            case 1:
                employeeModelPrepared = [self initializeEmployeeObject:@"Ravi" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"abhishek.ravi@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 2:
               employeeModelPrepared = [self initializeEmployeeObject:@"Kartik" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"Kartik.sharma@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 3:
                employeeModelPrepared = [self initializeEmployeeObject:@"Varun" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"varun@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 4:
                employeeModelPrepared = [self initializeEmployeeObject:@"vipin" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"vipin@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 5:
                employeeModelPrepared = [self initializeEmployeeObject:@"priyanshu" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"priyanshu@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 6:
                employeeModelPrepared = [self initializeEmployeeObject:@"kumar" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"kumar@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 7:
                employeeModelPrepared = [self initializeEmployeeObject:@"doga" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"doga@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 8:
                employeeModelPrepared = [self initializeEmployeeObject:@"krishna" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"krishna@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
            case 9:
                employeeModelPrepared = [self initializeEmployeeObject:@"arun" withAddress:@"xyz" withPhoneNumber:9818695993 withEmailId:@"arun@innovationM.com"];
                [self insertEmployeeToDB:employeeModelPrepared];
                break;
                
            default:
                break;
        }
    }
}

-(EmployeeModel *)initializeEmployeeObject :(NSString *)name withAddress:(NSString *)address withPhoneNumber : (NSInteger)phoneNumber withEmailId : (NSString *)emailId
{
    EmployeeModel *empModel = [[EmployeeModel alloc] init];
    empModel.name = name;
    empModel.address = address;
    empModel.phoneNumber = phoneNumber ;
    empModel.emailId = emailId;
    return empModel;
}

-(void)scrollToBottom{
    
    CGSize tableSize = self.tblView.contentSize;
    [self.tblView setContentOffset:CGPointMake(0, tableSize.height-(140))];
    
}

-(NSManagedObjectContext *)getManagedObectContext
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    return context;
}

-(NSMutableArray *)fetchEmployeeListFromDB
{
    NSMutableArray *employeeListFromDB;
    employeeListFromDB = [DBManager retrieveEmployeeListFromDB:[self getManagedObectContext]];
    return employeeListFromDB;
}

-(void)insertEmployeeToDB:(EmployeeModel *)employeeModel
{
    [DBManager insertIntoDB:[self getManagedObectContext] withEmployeeObject:employeeModel];
}

-(void)removeEmployeeFromList:(NSMutableArray *)employeeListToDelete
{
    [DBManager deleteRecordFromDB:[self getManagedObectContext] withListOfEmployee:employeeListToDelete];
}

-(void)excuteOperationForInterruption
{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    OperationManager *operationManager = [[OperationManager alloc] init];
    operationManager.employeeList = employeeList;
    [operationQueue addOperation:operationManager];
}

@end
