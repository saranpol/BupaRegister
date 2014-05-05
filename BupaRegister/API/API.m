//
//  API.m
//  BupaRegister
//
//  Created by saranpol on 4/20/2557 BE.
//  Copyright (c) 2557 BP. All rights reserved.
//

#import "API.h"

@implementation API


@synthesize mDataDict;

@synthesize mUserType;
@synthesize mUserCompany;
@synthesize mUserName;
@synthesize mUserSurname;
@synthesize mUserTel;
@synthesize mUserEmail;
@synthesize mUserPhotoPath;


@synthesize mArraySearchUser;
@synthesize mImageCurrent;

static API *instance;



+ (API*)getAPI {
    if (instance == nil) {
        instance = [[API alloc] init];
    }
    return instance;
}

- (API*)init {
    API *a = [super init];
    self.mDataDict = [[NSMutableDictionary alloc] init];

    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"user_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSError *e;
    self.mArraySearchUser = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&e];
    NSLog(@"error %@", e);
    
    return a;
}




// #PERSISTENCE_BEGEIN
#pragma mark - PERSISTENCE

- (id)getObject:(NSString*)key {
    id obj;
    obj = [mDataDict objectForKey:key];
    if(!obj){
        obj = [self loadObject:key];
        if(obj)
            [mDataDict setObject:obj forKey:key];
    }
    return obj;
}

- (id)loadObject:(NSString*)key {
	NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
	NSData *d = [u objectForKey:key];
	if(d){
		id obj = [NSKeyedUnarchiver unarchiveObjectWithData:d];
		return obj;
	}
	return nil;
}

- (void)saveObject:(id)obj forKey:(NSString*)key {
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
	NSData *d = [NSKeyedArchiver archivedDataWithRootObject:obj];
	[u setObject:d forKey:key];
	[u setObject:[NSDate date] forKey:[key stringByAppendingString:@"Date"]];
    [u synchronize];
    [mDataDict setObject:obj forKey:key];
}

- (void)deleteObject:(NSString*)key {
    NSUserDefaults *u = [NSUserDefaults standardUserDefaults];
    [u removeObjectForKey:key];
    [u synchronize];
    [mDataDict removeObjectForKey:key];
}

- (void)clearAllUserDefault {
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

// #PERSISTENCE_END




- (NSString *)documentsPathForFileName:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return [documentsPath stringByAppendingPathComponent:name];
}

- (NSString*)getFileImageName:(NSString*)name surname:(NSString*)surname {
    if(!name)
        name = @"";
    if(!surname)
        surname = @"";
    return [NSString stringWithFormat:@"%@_%@_%f.jpg", name, surname, [[NSDate date] timeIntervalSince1970]];
}


- (UIImage*)loadImage:(NSString*)name {
    NSString *imagePath = [self documentsPathForFileName:name];
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:imagePath]];
}

- (void)saveImage {
    NSData *imageData = UIImageJPEGRepresentation(mImageCurrent, 1);
    NSString *fileName = [self getFileImageName:mUserName surname:mUserSurname];
    self.mUserPhotoPath = fileName;
    NSString *imagePath = [self documentsPathForFileName:fileName];
    [imageData writeToFile:imagePath atomically:YES];
}



- (void)takePhoto:(id)v {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        [imagePickerController setCameraDevice:UIImagePickerControllerCameraDeviceFront];
    }else{
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePickerController setAllowsEditing:YES];
    [imagePickerController setDelegate:v];
    [v presentViewController:imagePickerController animated:YES completion:nil];
}


- (void)savePhoto:(NSDictionary *)info {
    self.mImageCurrent = [info objectForKey:UIImagePickerControllerEditedImage];
}

- (void)addUser {
    NSMutableArray *userArray = [self getObject:M_USER_ARRAY];
    if(!userArray)
        userArray = [NSMutableArray new];

    if(!mUserCompany)
        mUserCompany = @"";
    if(!mUserName)
        mUserName = @"";
    if(!mUserSurname)
        mUserSurname = @"";
    if(!mUserTel)
        mUserTel = @"";
    if(!mUserEmail)
        mUserEmail = @"";
    if(!mUserPhotoPath)
        mUserPhotoPath = @"";
    
    [self saveImage];

    
    NSMutableDictionary *user = [NSMutableDictionary new];
    [user setObject:[NSNumber numberWithInteger:mUserType] forKey:@"type"];
    [user setObject:mUserCompany forKey:@"company"];
    [user setObject:mUserName forKey:@"name"];
    [user setObject:mUserSurname forKey:@"surname"];
    [user setObject:mUserTel forKey:@"tel"];
    [user setObject:mUserEmail forKey:@"email"];
    [user setObject:mUserPhotoPath forKey:@"photo"];
    
    [userArray addObject:user];
    
    [self saveObject:userArray forKey:M_USER_ARRAY];
    

    // Clear
    self.mUserType = 2;
    self.mUserCompany = nil;
    self.mUserName = nil;
    self.mUserSurname = nil;
    self.mUserTel = nil;
    self.mUserEmail = nil;
    self.mUserPhotoPath = nil;
 
}

@end
