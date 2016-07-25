//
//  OLHomeModel.h
//  OLMVVM
//
//  Created by olive on 16/7/11.
//  Copyright © 2016年 olive. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface OLHomeModel : JSONModel
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *createAt;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsCreateTime;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsId;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsImage;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsLink;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsNum;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsSource;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsTitle;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *newsTypeName;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *objectId;
/** <#name#> */
@property (nonatomic, strong) NSString<Optional> *updatedAt;
@end
