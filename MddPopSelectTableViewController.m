//
//  MddPopSelectTableViewController.m
//  ChildrenLocation
//
//  Created by szalarm on 16/2/23.
//  Copyright © 2016年 szalarm. All rights reserved.
//

#import "MddPopSelectTableViewController.h"
//单元格
#import "MddPopSelectTableViewCell.h"
#import "MddPopSelectKeyValue.h"
@interface MddPopSelectTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MddPopSelectTableViewController
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
    if (nil!=self.mSelectArray) {
        
    }
    //自适应高度
    //自适应高度
    
    CGRect frame=self.view.frame;
    frame.size.width=(SCREEN_WIDTH*3/4)>300?(SCREEN_WIDTH*3/4):300;
    frame.size.height=SCREEN_HEIGHT/2;//高度不改
    self.view.frame=frame;

    //文字
    [self.mUiOkButton setTitle:_LS_(@"kMddToastTipsOk", nil) forState:UIControlStateNormal];
    [self.mUiCancelButton setTitle:_LS_(@"kMddToastTipsCancel", nil) forState:UIControlStateNormal];
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

- (IBAction)doCancel:(id)sender {
    //回传
    [self.mddDelegate mddPopCancelWtihCallBack:self.mSelectArray];
}

- (IBAction)doOk:(id)sender {
    //回传
    [self.mddDelegate mddPopOkWtihCallBack:self.mSelectArray];
}

//设置
-(void) mddPopSetValue:(NSMutableArray *)pValue
{
    self.mSelectArray=pValue;
    [self initData];
}
//构造函数
+ (instancetype)initializeForNib
{
    MddPopSelectTableViewController *mddVc = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    return mddVc;

}
//构造函数
+ (instancetype)initializeForNibWtihData:(NSMutableArray *)pData forDelegate:(id<MddPopSelectTableDelegate>)pDelegate
{
    MddPopSelectTableViewController *mddVc = [[[self class] alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
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
    static NSString * fIndent=@"MddPopSelectTableViewCell";
    MddPopSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fIndent];
    if ([self.mUiConextTableView isEqual:tableView]) {
        //空值判断
        if (nil==cell) {
//            cell=[[MddPopSelectTableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:fIndent];
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MddPopSelectTableViewCell" owner:self options:nil];
            cell = [array objectAtIndex:0];
            //文件名加载
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        
        MddPopSelectKeyValue  * fData=mSelectArray[indexPath.row];

        [cell setMData:fData];
//        cell.mUiTitleLabel.text=@"aaa";
//        cell.textLabel.text=@"bb";
//        cell.accessoryType=UITableViewCellAccessoryDetailButton;
        
        
    }
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MddPopSelectTableViewCell *oneCell = [tableView cellForRowAtIndexPath: indexPath];
    //key
    MddPopSelectKeyValue * key=oneCell.mData;
    //选中
    BOOL isSelect=key.mIsSelected;
    isSelect=!isSelect;
    key.mIsSelected=isSelect;
    [oneCell setMData:key];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
