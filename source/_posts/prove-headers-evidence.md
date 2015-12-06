title: HTTP Headers 后续调查
date: 2015-12-06 10:45:10
tags: [HTTP Headers,算不上问题]
description: HTTP Headers
---
最近在玩一个chillingo公司出的类似找东西一类的侦探型游戏：Another Case Solved［AppStore有下啦］

然后我就忽然觉得上次对curl里面headers的说明还是不够详细

特别需要一些强有力的证据来进行证明

所以，这不就来了。

### New Evidence

首先，得说一说这个证据的来源

[https://tools.ietf.org/html/rfc7230](https://tools.ietf.org/html/rfc7230)

啥是[IETF](http://baike.baidu.com/view/1451264.htm?fromtitle=IETF&fromid=2800318&type=syn)？

[RFC](http://baike.baidu.com/subview/6108/5073687.htm)又是什么？

如果把这些都扯进来就没完没了了（本来是不做伸手党的，方便点还是贴了传送门），只要知道它是一个标准

![](/resource/ietf_rfc7230.png)

图中Category被标为：__Standards Track__

### To Prove

继续贴图

![](/resource/header_fields.png)

这里面其实只说了一个大概的key与value的格式

这个格式差不多是长这个样子的：

```
header-field = field-name ":" OWS field-value OWS
```

![](/resource/OWS_defination.png)

其中OWS代表可选的空白

![](/resource/field_parse.png)

这个说的就比较详细了，其中有那么一句话

```
No whitespace is allowed between the header field-name and colon.
```

意思很明确，就是在header的key与冒号之间不能有空格产生。

### Special Recommend

最后，要提的就是之前找证据的时候，还看到一篇关于HTTP headers的文章

如果懒得看上面的rfc中冗长的约定的话，建议可以读一读这个 [Bizcoder](http://www.bizcoder.com/everything-you-need-to-know-about-http-header-syntax-but-were-afraid-to-ask)

