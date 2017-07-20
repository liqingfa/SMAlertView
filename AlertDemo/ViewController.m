//
//  ViewController.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "ViewController.h"
#import "SMAlert.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)NSArray *titles1;
@property(nonatomic, strong)NSArray *titles2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titles1 = @[@"内容-左右按钮",@"内容-一个按钮",@"内容-无按钮"];
    self.titles2 = @[@"图片-内容-左右按钮",@"图片-内容-一个按钮",@"图片-内容-无按钮"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.titles1.count;
    }
    return self.titles2.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section==0) {
        cell.textLabel.text = self.titles1[indexPath.row];
    }else{
        cell.textLabel.text = self.titles2[indexPath.row];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [SMAlert setAlertBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    
    if (indexPath.section==0) {
        [SMAlert setConfirmBtBackgroundColor:[UIColor whiteColor]];
        [SMAlert setConfirmBtTitleColor:[UIColor redColor]];
        [SMAlert setCancleBtBackgroundColor:[UIColor whiteColor]];
        [SMAlert setCancleBtTitleColor:[UIColor blueColor]];
        if (indexPath.row == 0) {
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
        }else if (indexPath.row == 1){
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:nil];
        }else if (indexPath.row == 2){
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:nil cancleButton:nil];
        }
    }else{
        [SMAlert setConfirmBtBackgroundColor:[UIColor colorWithRed:89/255.0 green:183/255.0 blue:255/255.0 alpha:1]];
        [SMAlert setConfirmBtTitleColor:[UIColor whiteColor]];
        [SMAlert setCancleBtBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:1]];
        [SMAlert setCancleBtTitleColor:[UIColor whiteColor]];
        if (indexPath.row == 0){
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
        }else if(indexPath.row==1){
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"是否打印该价签" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:nil];
        }else if(indexPath.row==2){
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"您的权限已被修改，即将退出登录" confirmButton:nil cancleButton:nil];
        }
    }
}
@end
