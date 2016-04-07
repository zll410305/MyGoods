//
//  CityListView.m
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "CityListView.h"
#import "Header.h"
#import "HomeViewController.h"

#import <CoreLocation/CoreLocation.h>   //定位  1.

@interface CityListView ()<UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate>  //2.

@property (strong, nonatomic)NSMutableArray *mutArr;

@property (strong, nonatomic)CLLocationManager *locationManger;  // 3.




@end

@implementation CityListView

- (void)viewDidLoad {
    [super viewDidLoad];
    //顶部
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    v1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:v1];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, 32, 10, 20)];
    [btn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [v1 addSubview:btn];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 32, 80, 20)];
    titleLab.text = @"选择城市";
    titleLab.font = [UIFont systemFontOfSize:18];
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [v1 addSubview:titleLab];

    
    self.automaticallyAdjustsScrollViewInsets = NO;  //
    self.cityTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    self.cityTable.delegate = self;
    self.cityTable.dataSource = self;
    self.cityTable.sectionIndexColor = [UIColor grayColor];   //索引颜色
    self.cityTable.sectionIndexBackgroundColor = [UIColor clearColor];  //索引与cell
    [self.view addSubview:self.cityTable];
    
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePlist = [mainBundle pathForResource:@"cityData" ofType:@"plist"];
    
    self.cityProvince = [[NSDictionary alloc]initWithContentsOfFile:filePlist];
   
    
    self.cityArr = [[self.cityProvince allKeys]sortedArrayUsingSelector:@selector(compare:)];  //排序
    
    self.mutArr = [[NSMutableArray alloc]init];
    for (NSString *str1 in self.cityArr) {
        NSString *str2 = [NSString stringWithFormat:@"%@",str1];
        [self.mutArr addObject:str2];
    }
    
    
    //定位城市
    UIView *viewLocation = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
//    viewLocation.backgroundColor = [UIColor purpleColor];
    self.cityTable.tableHeaderView = viewLocation;
    
    UILabel *locationLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 24)];
    locationLab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    locationLab.text = @"    GPS定位城市";
    locationLab.font = [UIFont systemFontOfSize:15];
    locationLab.textColor =  [UIColor grayColor];
    [viewLocation addSubview:locationLab];
    
    
    //获得定位城市名字
    self.cityName = [[UILabel alloc]initWithFrame:CGRectMake(18, 24, 150, 24)];
self.cityName.text = @"点击定位，获取当地城市";
    self.cityName.font = [UIFont systemFontOfSize:15];
    self.cityName.textColor =  [UIColor grayColor];
    [viewLocation addSubview:self.cityName];

    
    
    UIButton *locationBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 24, 80, 24)];
    [locationBtn setTitle:@"定位" forState:UIControlStateNormal];  //定位显示
    [locationBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    locationBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [locationBtn addTarget:self action:@selector(location) forControlEvents:UIControlEventTouchUpInside];
    [viewLocation addSubview:locationBtn];
    
    
    
    
//    [self locate];  //6.调用定位方法
}

//4.开始定位
//- (void)locate{
//    //判断定位操作是否被允许
//    if ([CLLocationManager locationServicesEnabled]) {
//        self.locationManger = [[CLLocationManager alloc]init];
//        self.locationManger.delegate = self;
//        
//        
////        [self.locationManger requestAlwaysAuthorization];  //这句必须写
//        [self.locationManger requestWhenInUseAuthorization]; //当用的时候打开定位
//        
//        [self.locationManger startUpdatingLocation];  //开始定位
//        
//    }else{
//        //提示用户无法进行定位操作
// 
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请打开GPS定位" preferredStyle:UIAlertControllerStyleAlert];
//      
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
//        [alert addAction:action];
//        [self presentViewController:alert animated:YES completion:nil];
//
//        
//    }
//   
//    
//}

//5.实现定位协议回调方法
#pragma mark - CoreLocation Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //此处locations存储了只需更新的位置坐标，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManger stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];
    
    //获取当前所在城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count>0) {
            CLPlacemark *placeMark = [placemarks objectAtIndex:0];
            
            //将获取的所有信息到label上
            NSLog(@"输出信息：%@",placeMark.name);
            
            //获取城市
            NSString *city = placeMark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（若city为空，则可知是为直辖市）
                city = placeMark.administrativeArea;
            }
            
            self.cityName.text = city;
            
//            self.cityStr =city;
            NSLog(@"self.cityName.text %@",self.cityName.text);
            
        }else if (error == nil && placemarks.count == 0){
            
            NSLog(@"No results were returned!");
            
        }else if (error != nil){
            
            NSLog(@"An error occurred = %@",error);
            
        }
        
        
    }];
    
    //系统会一直更新数据，知道选择停止更新，因为我们只需获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager

       didFailWithError:(NSError *)error {
    
    
    
    if (error.code == kCLErrorDenied) {
        
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
        
    }
    
}


//定位城市
- (void)location{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请打开GPS定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];  //打开定位服务
//        
//        [[UIApplication sharedApplication]openURL:url];
        
        
        //判断定位操作是否被允许
        if ([CLLocationManager locationServicesEnabled]) {
            self.locationManger = [[CLLocationManager alloc]init];
            self.locationManger.delegate = self;
            
            
                    [self.locationManger requestAlwaysAuthorization];  //这句必须写
//            [self.locationManger requestWhenInUseAuthorization]; //当用的时候打开定位
            
            [self.locationManger startUpdatingLocation];  //开始定位
            
        }else{
            //提示用户无法进行定位操作
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请打开GPS定位" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
            
        }


        
    }];
    
    [self.locationManger stopUpdatingLocation];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];

    [alert addAction:action];
    [alert addAction:action2];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return self.cityArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}
//索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    


    return self.mutArr;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   

    NSString *privence = [self.cityArr objectAtIndex:section];
    
    NSArray *city = [self.cityProvince objectForKey:privence];
    
        return city.count;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    sectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(18, 5, 100, 15)];
    
    label.text = [NSString stringWithFormat:@"%@",self.cityArr[section]];
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:15];
        [sectionView addSubview:label];
    return sectionView;
}

//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
   
    return [self.cityArr objectAtIndex:section];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"city";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
   
    NSInteger section = indexPath.section;
    NSString *teamGroup  = [self.cityArr objectAtIndex:section];
    NSArray *team = [self.cityProvince objectForKey:teamGroup];
    cell.textLabel.text = [team objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.delegate != nil && [_delegate respondsToSelector:@selector(getCityName:)]) {
        NSInteger section = indexPath.section;
        NSString *teamGroup  = [self.cityArr objectAtIndex:section];
        NSArray *team = [self.cityProvince objectForKey:teamGroup];
        NSString *cityName = [team objectAtIndex:indexPath.row];
        [_delegate getCityName:cityName];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)backHome{
    
    [self.navigationController popViewControllerAnimated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
