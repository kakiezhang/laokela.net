title: 一个关于CURL Headers的算不上问题
date: 2015-11-22 11:33:39
tags: [算不上问题]
description: curl Headers
---
其实也不是一个什么大不了的事件啦

### 案发还原
前两天哥在coding的时候，由于对请求中的Headers理解的不够清楚，以至于解决事件的时间有点过长了，相当不爽啊。

__切正题__

一般我们的curl设置Headers是咋设的？

之前用python比较顺手，这里用urllib来做一个

```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import urllib.parse
import urllib.request

url = 'http://github.com/kakiezhang'
values = {
    'a' : '1',
    'b' : '2',
}
headers = {
    'User-Agent' : 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
    'Referer' : 'http://github.com/kakiezhang',
}

data = urllib.parse.urlencode(values)
data = data.encode('utf-8')
req = urllib.request.Request(url, data, headers)
response = urllib.request.urlopen(req)
result = response.read().decode()
```

好简单，也好理解是不是，但是我需要以php实现的时候是这样写的：

```
<?php
$url = "http://github.com/kakiezhang";

$values = [
    'a' => '1',
    'b' => '2',
];

$url .= '?'.http_build_query($values);

$headers = [
    'User-Agent : Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)',
    'Referer : http://github.com/kakiezhang',
];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, 1);
$result = curl_exec($ch);
curl_close($ch);
?>
```

看上去好像没问题，但是这里却犯了个错

对于每一个Headers当中的key，后面都需要直接跟上万恶的“:”，不然Headers就无法被吃上

Headers没有生效的原因很简单，来看张图：

![](/resource/request_headof_zhihu.png)

看到Headers本身就是以`key:value`这样的格式存在的，在key后面多个空格违背了其所定义的格式至无法被正常解析。

### 算不上问题

这种细节类的东西看似渺小，但是却能衍生一大堆问题出来，而且每次解决完就感觉自己很无知！！

像这一类的算不上问题肯定还有好多，所以我觉得理应当加个“算不上问题”标签！

### 拖延症

这次稍微啰嗦一句，前段时间稍微研究了一下statsd（不知道的baidu，google啦），然后把它官方的文档英译中了一下，已经完成了其中的大部分，这两天准备做一些最后的修改，由于其间隔得时间稍微有些长，所以我会先将翻译放出来，之后会对其中的一些算法作出适当的解释（有点饭泡粥。。。）

