//
//  SingletonClass.m
//  LearningSingletonObject
//
//  Created by Abhishek Shukla on 24/08/15.
//  Copyright (c) 2015 InnovationM. All rights reserved.
//

#import "SingletonClass.h"

@implementation SingletonClass

//+(instancetype)getSingletonInstance
//{
//    static id _sharedSingletonClass = nil;
//    @synchronized([SingletonClass class])
//    {
//        if (_sharedSingletonClass == nil)
//        {
//            _sharedSingletonClass = [[super alloc] initUniqueInstance];
//            return _sharedSingletonClass;
//        }
//        return _sharedSingletonClass;
//    }
//    return nil;
//}

+(instancetype)getSingletonInstance{
    static long pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(instancetype)initUniqueInstance{
    return [super init];
}

@end
