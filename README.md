ape_blog源码云博客
===============

> 运行环境要求PHP7.1+。

## 主要特性

✨ 高颜值： 提供高性能模板机制，可以根据不同的情况自由发挥设置数据自己的模板

🔐 权限验证： 可视化的管理权限，然后根据权限动态的注册路由、菜单、页面、按钮(权限节点)，自由分派页面和按钮权限。

📝 未来可期： 我们正在持续维护系统，【计划】并着手开发各种oss、云短信等的支持，甚至提供开箱即用的各行业完整应用。

🚀 高效二开： 使用最新的 ThinkPHP 6.0框架、后台应用form-builder 无需写页面快速增删改查可为您节省大量开发时间。

🧱 一举多得： 后台自适应PC、平板、手机等多种场景的支持，轻松应对各种需求。

💖 其他杂项： 强大的后台权限管理 角色组/管理员/管理员日志、系统配置/导航管理等等、更多特性等你探索...

## 自动安装
1. 上传文件到网站根目录
2. 修改目录权限（linux系统）777  
   /public  
   /runtime
3. 安装好拓展
4. 设置伪静态
5. 配置好域名，在浏览器里打开域名，根据安装向导进行安装
6. 后台登录 http://域名/admin

## 设置伪静态

```ngnixconf

location /admin/ {
    index  index.php index.html index.htm;
     if (!-e $request_filename){
        #后台文件更名了需要在这里修改
        rewrite ^/admin/(.*)$ /admin.php?s=$1;
     }
}

 location /api/ {
      index  index.php index.html index.htm;
       if (!-e $request_filename){
          rewrite ^/api/(.*)$ /api.php?s=$1;
       }
}

location / {
  index  index.php index.html index.htm;
   #如果请求既不是一个文件，也不是一个目录，则执行一下重写规则
  if (!-e $request_filename){
      #地址作为将参数rewrite到index.php上。
      rewrite ^/(.*)$ /index.php?s=$1 last;
      #若是子目录则使用下面这句，将subdir改成目录名称即可。
      #rewrite ^/subdir/(.*)$ /subdir/index.php?s=$1;
  }    
}

```

```apacheconf
RewriteRule '^/admin/(.*)$$' /admin.php?s=$1; [L] 
RewriteRule '^/api/(.*)$$' /api.php?s=$1; [L] 
RewriteRule '^/(.*)$$' /index.php?s=$1 [L] 
```

## 文档

[TP6开发手册](https://www.kancloud.cn/manual/thinkphp6_0/content)  
[FormBuilder](http://php.form-create.com/)  
[Light Year Admin](http://www.itshubao.com/doc-lyear/lyear.html)  

## 官网体验

[源码云博客](https://blog.apecloud.cn/)  

## 联系我

- 邮箱：1099438829@qq.com 
- QQ：1099438829  

## 特别鸣谢
💕 感谢巨人提供肩膀，排名不分先后

[Thinkphp](https://www.thinkphp.cn/)  
[FormBuilder](http://php.form-create.com/)  
[Light Year Admin](https://gitee.com/yinqi/Light-Year-Admin-Template)  
[PaiAdmin](http://demo.kuzuozhou.cn/)  
[corepress](https://www.lovestu.com/corepress.html)  

还有很多未标注出来的，再次表示深深的感谢

## 版权信息
🔐 apeblog 遵循Apache2开源协议发布，并提供免费使用。

本项目包含的第三方源码和二进制文件之版权信息另行标注。

版权所有Copyright © 2019-2025 by 木子的忧伤 (https://www.apecloud.cn)

All rights reserved。

## 支持项目
💕 无需捐赠，如果觉得项目不错，或者已经在使用了，希望你可以去 Github 或者 Gitee 帮我们点个 ⭐ Star，这将是对我们极大的鼓励与支持。


