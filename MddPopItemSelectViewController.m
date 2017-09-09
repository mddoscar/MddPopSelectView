//
//  MddPopItemSelectViewController.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/24.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddPopItemSelectViewController.h"
// 
//单元格
#import "MddPopItemSelectTableViewCell.h"
#import "PopObjKeyValue.h"
//
#define kCellHeight 50
#define kMAxViewHeight 200
#define kMinViewHeight 100
@interface MddPopItemSelectViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation MddPopItemSelectViewController
//绑定
@synthesize mddDelegate=mddDelegate;
@synthesize mSelectArray=mSelectArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self myInit];
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initEvent];
}
//已经出现
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //是数字(是否数字)
    //    if (![@"0" isEqualToString:self.isNumber]) {
    //        [self mddSetTextTypeNumber];
    //    }
}
-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self doSetNil];
}
-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
//初始化
-(void) myInit
{
    [self initEvent];
    [self initData];
}
//初始化数据
-(void) initData
{
    int tViewHeight=kCellHeight;
    if (nil!=self.mSelectArray) {
        tViewHeight=kCellHeight*[self.mSelectArray count];
    }
    //最小
    if (tViewHeight<kMinViewHeight) {
        tViewHeight=kMinViewHeight;
    }
    //最大
    if (tViewHeight>kMAxViewHeight) {
        tViewHeight=kMAxViewHeight;
    }
    //自适应高度
    //自适应高度
    CGRect frame=self.view.frame;
    frame.size.width=(SCREEN_WIDTH*2/4)>200?(SCREEN_WIDTH*2/4):200;
    frame.size.height=tViewHeight;//高度不改
    self.view.frame=frame;

    //刷新
    [self.mUiConextTableView reloadData];
}
//设置事件
-(void) initEvent
{
    
    self.mUiConextTableView.dataSource=self;
    self.mUiConextTableView.delegate=self;
}
//置空
-(void) doSetNil
{
    self.mUiConextTableView.dataSource=nil;
    self.mUiConextTableView.delegate=nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//设置
-(void) mddPopSetValue:(NSMutableArray *)pValue
{
    self.mSelectArray=pValue;
    [self initData];
}
//构造函数
+ (instancetype)initializeForNib
{
    MddPopItemSelectViewController *mddVc = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    return mddVc;
    
}
//构造函数
+ (instancetype)initializeForNibWtihData:(NSMutableArray *)pData forDelegate:(id<MddPopItemSelectTableDelegate>)pDelegate
{
    MddPopItemSelectViewController *mddVc = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    mddVc.mddDelegate=pDelegate;
    [mddVc mddPopSetValue:pData];
    return mddVc;
}
#pragma mark tableview相关
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    long result=0;
    if (mSelectArray) {
        result=[mSelectArray count];
    }
    return result;
}

/**/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //如果是接收
    static NSString * fIndent=@"MddPopItemSelectTableViewCell";
    MddPopItemSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fIndent];
    if ([self.mUiConextTableView isEqual:tableView]) {
        //空值判断
        if (nil==cell) {
            //            cell=[[MddPopSelectTableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:fIndent];
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MddPopItemSelectTableViewCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
            //文件名加载
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        
        PopObjKeyValue  * fData=mSelectArray[indexPath.row];
        
        [cell setMData:fData];
        
    }
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MddPopItemSelectTableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
    //key
    PopObjKeyValue * key=oneCell.mData;
//    //选中
//    BOOL isSelect=key.mIsSelected;
//    isSelect=!isSelect;
//    key.mIsSelected=isSelect;
//    [oneCell setMData:key];
    [mddDelegate mddPopSelectItemWtihCallBack:key onIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark 高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}
+(NSMutableArray *) getItemArrWithStrArr:(NSArray *) pStrArray
{
    NSMutableArray *rArr=[NSMutableArray array];
    for (NSString * sobj in pStrArray) {
        PopObjKeyValue *obj=[[PopObjKeyValue alloc] initWithDataText:sobj mData:sobj];
        [rArr addObject:obj];
    }
    return rArr;
}
@end
