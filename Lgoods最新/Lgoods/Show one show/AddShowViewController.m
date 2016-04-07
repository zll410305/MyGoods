//
//  AddShowViewController.m
//  Lgoods
//
//  Created by Administrator on 16/4/6.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "AddShowViewController.h"


#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
@interface AddShowViewController ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong, nonatomic)UITextView *inputText;

@end

@implementation AddShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"秀一秀";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(publishShow:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.inputText= [[UITextView alloc]initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH - 20, 300)];
    self.inputText.delegate = self;
    self.inputText.returnKeyType = UIReturnKeyDefault;//返回键类型
    self.inputText.keyboardType = UIKeyboardTypeDefault;//键盘类型
    self.inputText.autoresizingMask = UIViewAutoresizingFlexibleHeight;// 自适应高度
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        self.automaticallyAdjustsScrollViewInsets = NO; // Avoid the top UITextView space, iOS7 (~bug?)
    }
    [self.view addSubview:_inputText];
    
    UIButton *addPic = [[UIButton alloc]initWithFrame:CGRectMake(15, 335, 30, 30)];
    [addPic setBackgroundImage:[UIImage imageNamed:@"tbbuy_item_increase@2x.png"] forState:UIControlStateNormal];
    [addPic addTarget:self action:@selector(chosePic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addPic];
}

- (void)chosePic{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }
}

- (void)publishShow:(UIButton *)sender{
    
}


#pragma mark - UITextView Delegate Methods

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    [self saveImage:image withName:@"sdddssds.png"];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}


#pragma mark - 保存图片至沙盒
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    UIImage *image = [self image:currentImage andWithWidth:600];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.6);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:YES];
}

//   图片压缩
- (UIImage *)image:(UIImage *)sourceImage andWithWidth:(CGFloat)Width{
    CGFloat width = sourceImage.size.width;
    CGFloat height = sourceImage.size.height;
    CGFloat targetWidth = Width;
    CGFloat targetHeight = (targetWidth/width)*height;
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
