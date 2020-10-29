package cn.yusui.xb.modules.base.controller.app;

import cn.yusui.xb.common.utils.IpUtil;
import cn.yusui.xb.common.utils.KeepSessionUtil;
import cn.yusui.xb.common.utils.R;
import cn.yusui.xb.modules.base.entity.Httpcookie;
import cn.yusui.xb.modules.base.entity.User;
import cn.yusui.xb.modules.base.service.HttpcookieService;
import cn.yusui.xb.modules.base.service.UserService;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 保持同一session的HttpClient工具类
 * @author linjingfeng
 *
 */
@RestController
@RequestMapping("/app")
@CrossOrigin
public class keepSessionController {
    @Autowired
    HttpcookieService httpcookieService;
    @Autowired
    private UserService userService;
    @Autowired
    protected HttpServletRequest request;

    /**
     * app登录返回用户信息
     */
    @ResponseBody
    @RequestMapping(value = "/appLogin",method = RequestMethod.GET)
    public R appLogin(@RequestParam Map<String,String> mapParms) throws IOException {
        //用户登陆
        R resultAll = KeepSessionUtil.postLogin("http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+"/xboot/login?username="+mapParms.get("username")+"&password="+mapParms.get("password"), "");
        CookieStore cookieStore = (CookieStore)resultAll.get("cookieStore");
        JSONObject result = (JSONObject)resultAll.get("result");
        int code = (Integer)result.get("code");
        if(code == 200){
            User user = userService.findByUsername(mapParms.get("username"));
            String userid = user.getId();
            //获取当前用户的cookie
            List<Cookie> cookies = cookieStore.getCookies();

            //将session_key session_value version domain path 等保存至数据库
            Httpcookie httpcookie = new Httpcookie();
            httpcookie.setSessionKey(cookies.get(0).getName());
            httpcookie.setSessionValue(cookies.get(0).getValue());
            httpcookie.setUserid(userid);
            httpcookie.setIsdelete(1);
            QueryWrapper<Httpcookie> queryWrapper = new QueryWrapper<Httpcookie>();
            queryWrapper.eq("userid",userid);
            //先判断当前用户是否已经登录
            Httpcookie httpcookie1 = httpcookieService.getOne(queryWrapper);
            if(httpcookie1 != null){
                httpcookieService.update(httpcookie,queryWrapper);
            }else{
                httpcookieService.save(httpcookie);
            }
            return R.ok(result.get("message").toString()).put("user",user).put("code",code);
        }
       return R.error(code,result.get("message").toString());
    }

    /**
     * app登出
     */
    @ResponseBody
    @RequestMapping(value = "/appLogout/{userid}",method = RequestMethod.GET)
    public R appLogout(@RequestParam Map<String,String> mapParms,@PathVariable("userid") String userid) throws IOException {
        //其他操作
        //从数据库中查找userid为1的session
        QueryWrapper<Httpcookie> queryWrapper = new QueryWrapper<Httpcookie>();
        queryWrapper.eq("userid",userid);
        Httpcookie hcookieDo = httpcookieService.getOne(queryWrapper);
        if(hcookieDo.getSessionValue() == null){
            //表示当前用户还没有登录 提示登录0

        }else{
            Httpcookie httpcookie = new Httpcookie();
            httpcookie.setSessionKey("");
            httpcookie.setSessionValue("");
            httpcookie.setUserid(userid);
            httpcookie.setIsdelete(0);
            httpcookieService.update(httpcookie,queryWrapper);
        }
        R resultAll = KeepSessionUtil.getLogout("http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+"/xboot/common/needLogin");
        return resultAll;
    }

    /**
     * 其他操作post util
     */
    public R appPostUtil(Httpcookie httpcookie,String requestUrl,String mapParms) throws IOException {
        //其他操作
        String url = "http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+requestUrl;

        CookieStore cookieStore = null;
        if(httpcookie.getSessionValue().equals("") && httpcookie.getSessionKey().equals("")){
            //表示当前用户还没有登录 提示登录0
            return R.error(500,"当前用户还没有登录!");
        }else{
            try{
                cookieStore = KeepSessionUtil.setCookieStore(httpcookie.getSessionKey(),httpcookie
                        .getSessionValue(),IpUtil.getHostIp());
            }catch (Exception e){
                return R.error("可能由于服务器重启导致的cookie失效，请重新登录!");
            }
        }
        R resultAll = KeepSessionUtil.post(url,mapParms,cookieStore);
        return resultAll;
    }

    /**
     * 其他操作get util
     */
    public R appGetUtil(Httpcookie httpcookie,String requestUrl) throws IOException {
        //其他操作
        String url = "http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+requestUrl;
        CookieStore cookieStore = null;
        if(httpcookie.getSessionValue() == null){
            //表示当前用户还没有登录 提示登录0
            return R.error(500,"当前用户还没有登录");
        }else{
            try{
                cookieStore = KeepSessionUtil.setCookieStore(httpcookie.getSessionKey(),httpcookie
                        .getSessionValue(),IpUtil.getHostIp());
            }catch (Exception e){
                return R.error(500,"可能由于服务器重启导致的cookie失效，请重新登录");
            }
        }
        R resultAll =KeepSessionUtil.get(url,cookieStore);

        return resultAll;
    }
    /**
     * 其他操作post
     */
    /*@ResponseBody
    @RequestMapping(value = "/appPost/{userid}",method = RequestMethod.GET)
    public R appPost(@PathVariable("userid") String userid,@RequestParam Map<String,String> mapParms) throws IOException {
        //其他操作
        String url = "http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+mapParms.get("requestUrl").toString();
        //从数据库中查找userid为1的session
        QueryWrapper<Httpcookie> queryWrapper = new QueryWrapper<Httpcookie>();
        queryWrapper.eq("userid",userid);
        Httpcookie httpcookie = httpcookieService.getOne(queryWrapper);
        CookieStore cookieStore = null;
        if(httpcookie.getSessionValue().equals("") && httpcookie.getSessionKey().equals("")){
            //表示当前用户还没有登录 提示登录0
              return R.error(500,"当前用户还没有登录!");
        }else{
            try{
                cookieStore = KeepSessionUtil.setCookieStore(httpcookie.getSessionKey(),httpcookie
                        .getSessionValue(),IpUtil.getHostIp());
            }catch (Exception e){
                return R.error("可能由于服务器重启导致的cookie失效，请重新登录!");
            }
        }
        R resultAll = KeepSessionUtil.post(url,mapParms==null?"":mapParms.toString(),cookieStore);
        *//*JSONObject obj = null;
        if(resultAll ==null){
            return R.ok(obj);
        }*//*
        return resultAll;
    }*/
/**
 * 其他操作get
 */
    /*@ResponseBody
    @RequestMapping(value = "/appGet/{userid}",method = RequestMethod.GET)
    public R appGet(@RequestParam Map<String,String> mapParms,@PathVariable("userid") String userid) throws IOException {
        //其他操作
        //String url = "http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+mapParms.get("requestUrl").toString();
        //从数据库中查找userid为1的session
        QueryWrapper<Httpcookie> queryWrapper = new QueryWrapper<Httpcookie>();
        queryWrapper.eq("userid",userid);
        Httpcookie httpcookie = httpcookieService.getOne(queryWrapper);
        CookieStore cookieStore = null;
        if(httpcookie.getSessionValue() == null){
            //表示当前用户还没有登录 提示登录0
            return R.error(500,"当前用户还没有登录");
        }else{
            try{
                cookieStore = KeepSessionUtil.setCookieStore(httpcookie.getSessionKey(),httpcookie
                        .getSessionValue(),IpUtil.getHostIp());
            }catch (Exception e){
                return R.error(500,"可能由于服务器重启导致的cookie失效，请重新登录");
            }
        }
        String url = "http://"+IpUtil.getHostIp()+":"+request.getLocalPort()+"/getData/getCodeValues";
        R resultAll =KeepSessionUtil.get(url,cookieStore);

        return resultAll;
    }*/



    /**
     * 其他操作post
     */
    @ResponseBody
    @RequestMapping(value = "/appPost/{userid}",method = RequestMethod.GET)
    public R appPost(@PathVariable("userid") String userid,@RequestParam Map<String,String> mapParms) throws IOException {
        //其他操作
        //从数据库中查找userid为1的session
        QueryWrapper<Httpcookie> queryWrapper = new QueryWrapper<Httpcookie>();
        queryWrapper.eq("userid",userid);
        Httpcookie httpcookie = httpcookieService.getOne(queryWrapper);
        R resultR = appPostUtil(httpcookie,mapParms.get("requestUrl")==null?"":mapParms.get("requestUrl").toString(),mapParms.get("Parms")==null?"":mapParms.get("Parms").toString());
        return resultR;
    }

    /**
     * 其他操作get
     */
    @ResponseBody
    @RequestMapping(value = "/appGet/{userid}",method = RequestMethod.GET)
    public R appGet(@RequestParam Map<String,String> mapParms,@PathVariable("userid") String userid) throws IOException {
        //其他操作
        //从数据库中查找userid为1的session
        QueryWrapper<Httpcookie> queryWrapper = new QueryWrapper<Httpcookie>();
        queryWrapper.eq("userid",userid);
        Httpcookie httpcookie = httpcookieService.getOne(queryWrapper);
        R resultR = appGetUtil(httpcookie,mapParms.get("requestUrl")==null?"":mapParms.get("requestUrl").toString());

        return resultR;
    }


}
