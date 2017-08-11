//
//  ViewController.m
//  AlertDemo
//
//  Created by 李清发 on 2017/7/19.
//  Copyright © 2017年 李清发. All rights reserved.
//

#import "ViewController.h"
#import "SMAlert.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic, strong)NSMutableArray<NSArray<NSString *>*> *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titles = [NSMutableArray new];
    [self.titles addObject:@[@"内容-左右按钮",@"内容-一个按钮",@"内容-无按钮"]];
    [self.titles addObject:@[@"图片-内容-左右按钮",@"图片-内容-一个按钮",@"图片-内容-无按钮"]];
    [self.titles addObject:@[@"自定义view-左右按钮",@"自定义view-一个按钮",@"自定义view-无按钮"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titles.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.titles[section].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titles[indexPath.section][indexPath.row];
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
        [SMAlert setContentTextAlignment:NSTextAlignmentLeft];
        if (indexPath.row == 0) {
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
        }else if (indexPath.row == 1){
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }]];
        }else if (indexPath.row == 2){
            [SMAlert showContent:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。"];
        }
    }else if(indexPath.section==1){
        [SMAlert setConfirmBtBackgroundColor:[UIColor colorWithRed:89/255.0 green:183/255.0 blue:255/255.0 alpha:1]];
        [SMAlert setConfirmBtTitleColor:[UIColor whiteColor]];
        [SMAlert setCancleBtBackgroundColor:[UIColor colorWithRed:131/255.0 green:146/255.0 blue:165/255.0 alpha:1]];
        [SMAlert setCancleBtTitleColor:[UIColor whiteColor]];
        [SMAlert setContentTextAlignment:NSTextAlignmentCenter];
        if (indexPath.row == 0){
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"扈江离与辟芷兮，纫秋兰以为佩。汨余若将不及兮，恐年岁之不吾与。朝搴阰之木兰兮，夕揽洲之宿莽。日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
        }else if(indexPath.row==1){
            [SMAlert showImage:[UIImage imageNamed:@"shangpin_img_ticket"] content:@"日月忽其不淹兮，春与秋其代序。" confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }]];
        }else if(indexPath.row==2){
            [SMAlert showImage:[UIImage imageNamed:@"function_img_remind"] content:@"日月忽其不淹兮，春与秋其代序。"];
        }
    }else{
        [SMAlert setConfirmBtBackgroundColor:[UIColor whiteColor]];
        [SMAlert setConfirmBtTitleColor:[UIColor redColor]];
        [SMAlert setCancleBtBackgroundColor:[UIColor whiteColor]];
        [SMAlert setCancleBtTitleColor:[UIColor blueColor]];
        
        UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 280, 150)];
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(15, 70, 250, 35)];
        textField.layer.borderWidth = 0.5;
        textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [textField setReturnKeyType:UIReturnKeyDone];
        textField.delegate = self;
        [customView addSubview:textField];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 250, 15)];
        [title setFont:[UIFont systemFontOfSize:15]];
        [title setTextColor:[UIColor darkGrayColor]];
        title.text = @"请输入内容";
        [customView addSubview:title];
        
        if (indexPath.row == 0) {
            [SMAlert showCustomView:customView confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }] cancleButton:[SMButton initWithTitle:@"取消" clickAction:nil]];
        }else if (indexPath.row == 1){
            [SMAlert showCustomView:customView confirmButton:[SMButton initWithTitle:@"确定" clickAction:^{
                [SMAlert hide];
            }]];
        }else if (indexPath.row == 2){
            [SMAlert showCustomView:customView];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
