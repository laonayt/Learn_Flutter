//
//  ViewController.m
//  iOSObject
//
//  Created by W E on 2021/3/19.
//

#import "ViewController.h"
#import "AppDelegate.h"
@import Flutter;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Native首页";
    
}

- (IBAction)loginAction:(id)sender {
//    FlutterViewController *defaultVC = [[FlutterViewController alloc] init];
    
    FlutterViewController *loginVC = [[FlutterViewController alloc] initWithProject:nil initialRoute:@"loginPage" nibName:nil bundle:nil];
    
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (IBAction)detailAction:(id)sender {
    FlutterViewController *detailVC = [[FlutterViewController alloc] initWithProject:nil initialRoute:@"detailPage" nibName:nil bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (IBAction)flutterBoostAction:(UIButton *)sender {
    NSString *routeStr = sender.currentTitle;
    FlutterViewController *detailVC = [[FlutterViewController alloc] initWithProject:nil initialRoute:routeStr nibName:nil bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)showFlutter {
    //1、显式的创建
//    FlutterEngine *flutterEngine = ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
//    FlutterViewController *flutterViewController =
//        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    
    //2、隐式的创建，没有提前预热
//    FlutterViewController *flutterVC = [[FlutterViewController alloc] init];
//    [self.navigationController pushViewController:flutterVC animated:YES];
    
    /*
     引擎默认打开的是main.dart的page，也可自定义
     flutterEngine.run(withEntrypoint: "myOtherEntrypoint",libraryURI: "other_file.dart")
     
     [[FlutterViewController alloc] initWithProject:nil
                                             initialRoute:@"/onboarding"
                                                  nibName:nil
                                                   bundle:nil];
     */
}


@end
