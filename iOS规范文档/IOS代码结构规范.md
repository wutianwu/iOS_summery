# View代码结构规范
## 制定代码规范的重要性：
- 提高业务方View层的可读性可维护性
- 防止业务代码对框架产生腐蚀
- 确保传承
- 保持架构发展的方向不轻易被不合理的意见所左右
## viewController的代码结构，如图：
```objc
@property (nonatomic,strong) UIButton *confirmButton;
...
#pragma mark-life cycle

viewDidLoad

viewWillAppear
...
#pragma mark - UITableViewDelegate

methods

#pragma mark - CustomDelegate

methods

#pragma mark - event response

-(void)didTappedConfirmButton:(UIButton *)confirmButton

#pragma mark - private methods

methods

#pragma mark - getters and setters

-(UIButton *) confirmButton

-(UITableView *)tableView
```


> - 所有的属性都使用getter和setter
> - getter和setter全部都放在最后
> - 每一个delegate都把对应的protocol名字带上，delegate方法不要乱写，写到一块区域里面去
> - event response 专门开一个代码区域
> - 关于private methods，正常情况下ViewController里面不应该写

## 关于view布局
- 统一采用Masonry来做自动布局
## 何时使用storyboard，何时使用nib，何时使用代码写View
- 对于复杂的、动态生成的界面，建议使用手工编写界面
- 对于需要统一风格的按钮或者UI控件，建议使用手工代码开构造。方便之后的修改和复用
- 对于需要有继承或者组合关系的UIView类或UIViewController类，建议用代码手工编写界面
- 对于那些简单的、静态的、非核心功能界面，可以考虑使用xib或storyboard来完成。
## 不使用统一派生ViewController
- 集成成本
- 上手接受成本
- 架构的维护难度
## 寻找aop解决方案(Aspects)，需求如下：
- 业务方可以不用通过继承的方法，然后框架能够做到对ViewController的统一配置
- 业务方即使脱离框架环境，不需要修改任何代码也能够跑完代码，业务方的*ViewController*一旦丢入框架环境，不需要修改任何代码，框架就能够起到它应该起的作用
## IOS开发中的MVC划分
> M应该做的事情
>> - 给ViewController提供数据
>> - 给ViewController存储数据提供接口
>> - 提供经过抽象的业务基本组件，供Controller调度
> 
> C应该做的事情
>> - 管理View Container的生命周期
>> - 负责生成所有的View实例，并放入View Container
>> - 监听来自于View与业务有关的事情，通过与Model的合作，来完成对应事件的业务。
>
> V应该做的事情
>> - 响应与业务无关的事件，并因此引起动画效果，点击反馈（如果适合的话，尽量还是放在View去做）等
>> - 界面元素表达
## IOS系统框架MVVM
> MVVM是*居于胖Model的架构思路建立的，然后在胖Model中拆分两部分：Model和ViewModel* 
>
> View <-> C <-> ViewModel <-> Model
