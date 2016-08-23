//
//  SingletonClass.h
//  LearningSingletonObject
//
//  Created by Abhishek Shukla on 24/08/15.
//  Copyright (c) 2015 InnovationM. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ATTRIBUTE_ALLOC __attribute__((unavailable("alloc not available, call sharedSingletonInstance instead")))
#define ATTRIBUTE_INTI __attribute__((unavailable("init not available, call sharedSingletonInstance instead")))
#define ATTRIBUTE_NEW __attribute__((unavailable("new not available, call sharedSingletonInstance instead")))
#define ATTRIBUTE_COPY __attribute__((unavailable("copy not available, call sharedSingletonInstance instead")))

@interface SingletonClass : NSObject

+(instancetype)getSingletonInstance;
//+(instancetype)sharedSingletonInstance;
@property (nonatomic, copy) NSString *someProperty;

+(instancetype) alloc ATTRIBUTE_ALLOC;
-(instancetype) init  ATTRIBUTE_INTI;
+(instancetype) new   ATTRIBUTE_NEW;
+(instancetype) copy  ATTRIBUTE_INTI;

@end
