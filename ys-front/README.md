# ys-front前端框架设计文档

## 项目简介
- 项目基于 Vue-Cli 3.0正式版创建
- 主要Main组件框架基于iView-admin 1.0版本 修复其BUG
- 组件库升级iView3.0
- 后台加载动态权限菜单 多方式轻松权限控制至按钮显示
- 提供Vue空白模版，只需修改后台请求和对应实体字段即可完成页面开发
- 多语言切换、消息管理、第三方社交账号或短信登录
- iView使用图标库 [ionicons](http://ionicons.com/) 额外图标库 [vue-awesome](https://github.com/Justineo/vue-awesome)

## 主要所用技术
- [Vue 2.5.x](https://cn.vuejs.org/)
- [Vue Cli 3.x](https://github.com/vuejs/vue-cli)：[官方中文文档](https://github.com/vuejs/vue-cli/tree/dev/docs/zh/config)
- [Vue Router](https://router.vuejs.org/zh/)
- [Vuex](https://vuex.vuejs.org/zh-cn/)
- [vue-i18n](https://github.com/kazupon/vue-i18n)：国际化多语言插件 使用5.0.x版本
- [iView](https://www.iviewui.com/)   ui组件库
- [iview-admin](https://github.com/iview/iview-admin)
- [iview-area](https://github.com/iview/iview-area)：城市级联组件
- [wangeditor](https://github.com/wangfupeng1988/wangEditor)：轻量富文本编辑器
- [gitalk](https://github.com/gitalk/gitalk)：基于github issue评论插件
- [vue-stomp](https://github.com/FlySkyBear/vue-stomp)  带有针对VueJS的发送消息超时监视器插件
- [vue-json-pretty](https://github.com/leezng/vue-json-pretty)：Json美化
- [Print.js](http://printjs.crabbly.com/)：打印
- ES6
- webpack
- axios
- echarts
- cookie

## 本地开发构建运行

- 启动后端 ys 项目后，在 `vue.config.js` 中修改你的后端接口地址代理配置
- 在项目根文件夹 ys-front 下先后执行命令 `npm install` (若有报错请使用[cnpm](https://npm.taobao.org/))、 `npm run dev`
- 前台端口默认9999 http://localhost:9999

## 部署
- 执行过命令 `npm install` 后，执行 `npm run build` 将打包生成的 `dist` 静态文件放置Nginx服务器中，并配置反向代理。当然还可放置Spring Web等其他项目resources静态资源文件夹下可避免跨域(不推荐)。
- Nginx配置提醒 由于路由默认已使用history模式 需加入以下配置 完整配置参考见下方开发指南
```
location / {
	if (!-e $request_filename) {
        rewrite ^(.*)$ /index.html?s=$1 last;
        break;
    }
    ...
}
```

## 开发指南及技术栈说明
- [ys-front前端开发配置及部署说明【必读】](#ys-front前端开发配置及部署说明【必读】)
- [如何使用ys-front前端Vue模板快速开发增删改页面](#如何使用ys-front前端Vue模板快速开发增删改页面)
- 现已提供简单封装的带后台真实接口数据的组件，见XBoot业务组件菜单
---

## ys-front前端开发配置及部署说明【必读】
### 开发相关
由于权限菜单按钮设计 仅支持2级菜单 一级菜单下没子菜单将不会显示；为避免多次点击，且满足直接点击一级菜单跳转需求，一级菜单下只有1个二级菜单时直接显示该二级菜单，并非BUG
- UI组件使用详见iView官网文档
- Vue Cli 3.0 配置文件在 vue.config.js中，官方中文配置文档
- Tag标签页面缓存说明
    - 由于已使用keep-alive组件（Main.vue中），当且仅当组件name名与菜单路由中配置的路由名一致时页面缓存生效
    - 不想要缓存的页面还可以在/src/store/modules/app.js中的dontCache配置，将页面的name属性值配置进数组即可
- api接口建议统一放在src/api文件夹下统一引用方便管理，也可全局使用封装挂载好的请求方法，如this.getRequest、this.postRequest等
- 菜单页面动态添加说明
    - 系统菜单中动态添加配置，请参考已有配置。注：一级菜单组件只能填Main，二级菜单页面Vue组件请放置views目录中开发。
    - 配置后记得在角色管理中给用户配置菜单权限（分配后菜单实时刷新显示，无需刷新页面）
    
- 权限按钮或其他内容显示控制自定义标签：v-has，使用示例：
    ```
        <Button v-has="'add'">添加按钮</Button>
        <Button v-has="'edit'">编辑按钮</Button>
        <Button v-has="'delete'">删除按钮</Button>
        <div v-has="'view'">需要view权限的界面内容</div>
    ```

    - js中权限判断示例
    ```
        if(this.$route.meta.permTypes.includes("edit")){
            return ... ...
        }else{
            return ... ...
        }
    ```

- 根据角色全局控制权限显示自定义标签：v-hasRole，使用示例：
    ```
        <Button v-has="'ROLE_ADMIN'">添加按钮</Button>
    ```

    - 表格中或js中判断使用
    ```
        if(this.getStore('roles').includes("ROLE_ADMIN")){
            ... ...
        }
    ```

    - 其余配置全在后台配置即可

- 部署Nginx完整配置示例参考
```
    server {
        listen       80;
        server_name  localhost;

        location / {
            if (!-e $request_filename) {
                rewrite ^(.*)$ /index.html?s=$1 last;
                break;
            }
            root   xboot;
            index  index.html;
        }

        location /xboot/ {
            proxy_pass http://127.0.0.1:8888;
        }
        location /swagger-ui.html {
            proxy_pass http://127.0.0.1:8888;
        }
        location /swagger-resources {
            proxy_pass http://127.0.0.1:8888;
        }
        location /swagger {
            proxy_pass http://127.0.0.1:8888;
        }
        location /webjars {
            proxy_pass http://127.0.0.1:8888;
        }
        location /v2 {
            proxy_pass http://127.0.0.1:8888;
        }
        location /druid {
            proxy_pass http://127.0.0.1:8888;
        }

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        client_max_body_size 5m;

        error_page   500 502 503 504 404  /50x.html;
        location = /50x.html {
            root   html;
        }

    }
```
- 部署优化
    - 将打包生成的较大的js文件放置CDN或着带宽较快的服务器上或者第三方平台（如七牛云），更换相应index.html中js链接
---

## 如何使用ys-front前端Vue模板快速开发增删改页面
- 模版文件夹路径 src\views\xboot-vue-template
- 首先拷贝一个模版至src\views下文件夹路径中
- 启动前后台配置一个菜单页面 组件选择刚刚你配置拷贝的vue文件 参考其他页面菜单配置 记得给用户角色分配该页面权限
- 接下来主要就根据后台实体类修改相关字段和后台请求地址即可，下面简单介绍需要修改的部分，不清楚的地方详见iView官方文档：
    - 根据后台返回数据字段修改表格字段头
    - 修改模态框相应form字段
    - 最后修改相关增删改请求路径即可，当然建议api接口建议统一放在src/api文件夹下统一引用方便管理，这里只是为了方便测试