//
//  ViewController.m
//  LearningSingletonObject
//
//  Created by Abhishek Shukla on 24/08/15.
//  Copyright (c) 2015 InnovationM. All rights reserved.
//

#import "ViewController.h"
#import "SingletonClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SingletonClass *singletonClass = [SingletonClass getSingletonInstance];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
