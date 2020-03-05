#ifndef Y_Define_h
#define Y_Define_h
 

#ifdef DEBUG
#define Y_Log(...) NSLog(__VA_ARGS__)
#else
#define Y_Log(...)
#endif

//系统版本
#define Y_iOS7     ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
#define Y_iOS8     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 9.0)
#define Y_iOS9     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 10.0)
#define Y_iOS10    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

//屏幕宽高
#define Y_ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define Y_ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define Y_ScreenCenter  CGPointMake(Y_ScreenWidth * 0.5, Y_ScreenHeight * 0.5)
#define Y_MainScreen    [UIScreen mainScreen]
#define Y_KeyWindow     [[[UIApplication sharedApplication] windows] lastObject]

//颜色相关
#define Y_ColorFormRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define Y_ColorFormRGBA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define Y_ColorFormR_G_B(r,g,b)     [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define Y_ColorFormR_G_B_A(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define Y_RandomColor               Y_ColorFormR_G_B(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define Y_ClearColor                [UIColor clearColor]
#define Y_BlackColor                [UIColor blackColor]
#define Y_WhiteColor                [UIColor whiteColor]
#define Y_LightGrayColor            [UIColor lightGrayColor]
#define Y_DarkGrayColor             [UIColor darkGrayColor]
#define Y_LightTextColor            [UIColor lightTextColor]
#define Y_DarkTextColor             [UIColor darkTextColor]
#define Y_RedColor                  [UIColor redColor]
#define Y_GreenColor                [UIColor greenColor]
#define Y_BlueColor                 [UIColor blueColor]
#define Y_YellowColor               [UIColor yellowColor]
#define Y_OrangeColor               [UIColor orangeColor]
#define Y_BrownColor                [UIColor brownColor]
#define Y_PurpleColor               [UIColor purpleColor]
#define Y_GrayColor                 [UIColor grayColor]
#define Y_CyanColor                 [UIColor cyanColor]
#define Y_MagentaColor              [UIColor magentaColor]

#pragma mark -
#pragma mark ============== 常用功能性宏 ==============
#define Y_HALF(value)             (value * 0.5)
#define Y_DOUBLE(value)           (value * 2)
#define Y_RANDOM_INT(from,to)     ((int)(from + (arc4random() % (to - from + 1))))

#pragma mark -
#pragma mark ============== 显示功能性宏 ==============
//分割线高度
#define Y_SeparateLineH           0.25


#endif


