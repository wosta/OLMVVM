# OLMVVM
### 关于AFNetworking 3.0
#### NSURLConnection的API已废弃
AFNetworking 1.0 是建立在 NSURLConnection基础上的，AFNetworking 2.0 开始使用基于 NSURLConnection *API基础功能，同时也有基于新的NSURLSession* API 的功能实现。AFNetworking 3.0现在是专门建立在 NSURLSession 顶层的，这降低了维护负担，同时允许支持苹果为 NSURLSession 提供的任何额外的增强的特性。在Xcode 7，NSURLConnection API 已经被苹果官方弃用。然而API函数将继续使用不会受影响，只不过再也不会添加新的功能了，苹果建议所有基于网络的功能在未来都能使用 NSURLSession。

#### 3.0 被移除的类有
* AFURLConnectionOperation 
* AFHTTPRequestOperation 
* AFHTTPRequestOperationManager

#### 转而替代的是
* AFURLSessionManager 
* AFHTTPSessionManager

### 别说你会AFNetworking 3.0
[地址](http://www.360doc.com/content/16/0222/15/20919452_536453076.shtml)
