//
//  API.h
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define TYPE_1 @"สื่อมวลชน"
#define TYPE_2 @"BLOGGER"
//#define TYPE_3 @"โรงพยาบาล"
#define M_USER_ARRAY @"M_USER_ARRAY_1"


@interface API : NSObject


+ (API*)getAPI;

@property (nonatomic, strong) NSMutableDictionary *mDataDict;

@property (nonatomic, assign) NSInteger mUserType;
@property (nonatomic, strong) NSString *mUserCompany;
@property (nonatomic, strong) NSString *mUserName;
@property (nonatomic, strong) NSString *mUserSurname;
@property (nonatomic, strong) NSString *mUserTel;
@property (nonatomic, strong) NSString *mUserEmail;
@property (nonatomic, strong) NSString *mUserPhotoPath;

@property (nonatomic, strong) NSArray *mArraySearchUser;
@property (nonatomic, strong) UIImage *mImageCurrent;


// Persistence
- (id)getObject:(NSString*)key;
- (void)saveObject:(id)obj forKey:(NSString*)key;
- (void)deleteObject:(NSString*)key;
- (void)clearAllUserDefault;

// Image
- (NSString *)documentsPathForFileName:(NSString *)name;
- (UIImage*)loadImage:(NSString*)name;
- (void)saveImage;

- (void)takePhoto:(id)v;


- (void)savePhoto:(NSDictionary*)info;

- (void)addUser;

@end
