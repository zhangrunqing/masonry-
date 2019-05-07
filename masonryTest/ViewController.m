//
//  ViewController.m
//  masonryTest
//
//  Created by zrq on 2019/5/7.
//  Copyright © 2019 zrq. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import <Masonry.h>

#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    self.dataArray=[[NSMutableArray alloc]init];
    for (int i=0; i<20; i++) {
        NSMutableArray *ar=[[NSMutableArray alloc]initWithObjects:@"中村俊辅防空洞打破大好大的经济开发农村变成 v 和 v风吹牛逼女举 v 看 v 纠结多久吧女 vv 仿佛从 vv 家",@"财富规划好尴尬", nil];
        
        [self.dataArray addObject:ar];
        
    }
    [self.tableview reloadData];


}
-(void)createUI{
    
    UITableView *tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    tableview.dataSource=self;
    tableview.delegate=self;
    self.tableview=tableview;
    
    [self.view addSubview:tableview];
    
    
}


#pragma uitableviewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *cellid=@"cellid";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    
    UILabel *label1=[cell viewWithTag:100];
    if (label1==nil) {
        label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        label1.font=[UIFont systemFontOfSize:10];
        label1.tag=100;
        [cell addSubview:label1];

    }
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.mas_top).with.offset(10);
        make.left.equalTo(cell.mas_left).with.offset(0);
        make.height.mas_equalTo(30);
        
    }];
    NSArray *arr=self.dataArray[indexPath.row];
    NSString *firststr=arr[0];
    label1.text=firststr;
    
    
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    firstViewController  *fvc=[[firstViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
