package cn.yusui.xb.common.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.impl.client.*;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ljf on 2019/3/25.
 */
public class KeepSessionUtil {

    @SuppressWarnings("unused")
    private static List<NameValuePair> toNameValuePairList(String parameters) {
        if(parameters == null || parameters ==""){
            return null;
        }
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        String[] paramList = parameters.split("&");
        for (String parm : paramList) {
            int index = -1;
            for (int i = 0; i < parm.length(); i++) {
                index = parm.indexOf("=");
                break;
            }
            String key = parm.substring(0, index);
            String value = parm.substring(++index, parm.length());
            nvps.add(new BasicNameValuePair(key, value));
        }
        System.out.println(nvps.toString());
        return nvps;
    }
    /**
     * 把结果console出来
     *
     * @param httpResponse
     * @throws ParseException
     * @throws IOException
     */
    public static void printResponse(HttpResponse httpResponse) throws ParseException, IOException {
        // 获取响应消息实体
        HttpEntity entity = httpResponse.getEntity();
        // 响应状态
        System.out.println("status:" + httpResponse.getStatusLine());
        System.out.println("headers:");
        HeaderIterator iterator = httpResponse.headerIterator();
        while (iterator.hasNext()) {
            System.out.println("\t" + iterator.next());
        }
    }
    /**
     * 将cookie保存到cookieStore中供后续调用
     * @param sessionKey
     * @param sessionValue
     */
    public static CookieStore setCookieStore(String sessionKey,String sessionValue,String  domain) {
        System.out.println("----setCookieStore");
        CookieStore cookieStore = new BasicCookieStore();
        // 新建一个Cookie
        BasicClientCookie cookie = new BasicClientCookie(sessionKey,sessionValue);
        cookie.setVersion(0);
        cookie.setDomain(domain);
        cookie.setPath("/");
        cookieStore.addCookie(cookie);
        return cookieStore;
    }
    /**
     * app登录
     *
     * @param url
     * @param parameters
     *
     * @return response
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static R postLogin(String url, String parameters)
            throws IOException {
        HttpClientContext context = HttpClientContext.create();

        // 配置超时时间（连接服务端超时1秒，请求数据返回超时2秒）
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(120000).setSocketTimeout(60000)
                .setConnectionRequestTimeout(60000).build();

        // 设置默认跳转以及存储cookie
        CloseableHttpClient httpClient = HttpClientBuilder.create()
                .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                .setRedirectStrategy(new DefaultRedirectStrategy()).setDefaultRequestConfig(requestConfig)
                .build();

        HttpPost httpPost = new HttpPost(url);
        httpPost.setHeader("Content-type", "application/json; charset=utf-8");
        List<NameValuePair> nvps = toNameValuePairList(parameters);
        /*
        //將參數轉為json格式 參數
        Map map=new HashMap();
        if(nvps != null) {
            for (int i = 0; i < nvps.size(); i++) {
                NameValuePair na = nvps.get(i);
                map.put(na.getName(), na.getValue());
            }

        String jsonRequest= JSONUtil.toJSON(map);
        StringEntity se = new StringEntity(jsonRequest);
        httpPost.setEntity(se);
        }*/
        if(nvps != null){
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
        }
        CloseableHttpResponse response = httpClient.execute(httpPost, context);
        //打印结果
        printResponse(response);
        CookieStore cookieStore = context.getCookieStore();
        JSONObject obj= null;
        try {
            HttpEntity resEntity = response.getEntity();
            if (resEntity != null) {
                // 响应长度
                System.out.println("Response content length: "
                        + resEntity.getContentLength());
                // 打印响应内容
                String result = EntityUtils.toString(resEntity,"utf-8");
                // 生成 JSON 对象
                obj = JSONObject.parseObject(result);
            }
            // 销毁
            EntityUtils.consume(resEntity);
        } finally {
            if(response != null && response.getStatusLine().getStatusCode() == 200) {
                return R.ok().put("cookieStore",cookieStore).put("result",obj);
            }
            response.close();
        }
        return R.ok().put("cookieStore",null).put("result",null);
    }

    /**
     * app登出
     *
     * @param url
     *
     * @return response
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static R getLogout(String url)
            throws IOException {
        HttpClientContext context = HttpClientContext.create();
        // 配置超时时间（连接服务端超时1秒，请求数据返回超时2秒）
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(120000).setSocketTimeout(60000)
                .setConnectionRequestTimeout(60000).build();

        // 设置默认跳转以及存储cookie
        CloseableHttpClient httpClient = HttpClientBuilder.create()
                .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                .setRedirectStrategy(new DefaultRedirectStrategy()).setDefaultRequestConfig(requestConfig)
                .build();

        HttpGet httpGet = new HttpGet(url);
        CloseableHttpResponse response = httpClient.execute(httpGet, context);
        //打印结果
        printResponse(response);
        JSONObject obj= null;
        try {
            HttpEntity resEntity = response.getEntity();
            if (resEntity != null) {
                // 响应长度
                System.out.println("Response content length: "
                        + resEntity.getContentLength());
                // 打印响应内容
                String result = EntityUtils.toString(resEntity,"utf-8");
                // 生成 JSON 对象
                obj = JSONObject.parseObject(result);
            }
            // 销毁
            EntityUtils.consume(resEntity);
        } finally {
            if(response != null && response.getStatusLine().getStatusCode() == 200) {
                return R.ok().put("result",obj);
            }
            response.close();
        }
        return R.ok().put("result",null);
    }
    /**
     * http get
     *
     * @param url
     * @return response
     *
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static R get(String url,CookieStore cookieStore)
            throws IOException {
        HttpClientContext context = HttpClientContext.create();
        // 配置超时时间（连接服务端超时1秒，请求数据返回超时2秒）
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(120000).setSocketTimeout(60000)
                .setConnectionRequestTimeout(60000).build();

        // 设置默认跳转以及存储cookie
        CloseableHttpClient httpClient = HttpClientBuilder.create()
                .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                .setRedirectStrategy(new DefaultRedirectStrategy()).setDefaultRequestConfig(requestConfig)
                .setDefaultCookieStore(cookieStore).build();

        HttpGet httpget = new HttpGet(url);

        context.setCookieStore(cookieStore);
        CloseableHttpResponse response = httpClient.execute(httpget, context);
        //打印结果
        printResponse(response);
        HttpEntity resEntity = null;
        JSONObject obj= null;
        try {
            resEntity = response.getEntity();
            if (resEntity != null) {
                // 响应长度
                System.out.println("Response content length: "
                        + resEntity.getContentLength());
                // 打印响应内容
                String result = EntityUtils.toString(resEntity,"utf-8");
                // 生成 JSON 对象
                obj = JSONObject.parseObject(result);
            }
            // 销毁
            EntityUtils.consume(resEntity);
        } finally {
            response.close();
        }

         return R.ok().put("result",obj);
    }

    /**
     * http post
     *
     * @param url
     * @return response
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static R post(String url, String parameters,CookieStore cookieStore)
            throws IOException {
        HttpClientContext context = HttpClientContext.create();
        // 配置超时时间（连接服务端超时1秒，请求数据返回超时2秒）
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(120000).setSocketTimeout(60000)
                .setConnectionRequestTimeout(60000).build();

        // 设置默认跳转以及存储cookie
        CloseableHttpClient httpClient = HttpClientBuilder.create()
                .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                .setRedirectStrategy(new DefaultRedirectStrategy()).setDefaultRequestConfig(requestConfig)
                .setDefaultCookieStore(cookieStore).build();

        HttpPost httpPost = new HttpPost(url);
        List<NameValuePair> nvps = toNameValuePairList(parameters);
        if(nvps != null){
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
        }
        context.setCookieStore(cookieStore);
        CloseableHttpResponse response = httpClient.execute(httpPost, context);
        //打印结果
        printResponse(response);
        JSONObject obj= null;
        try {
            HttpEntity resEntity = response.getEntity();
            if (resEntity != null) {
                // 响应长度
                System.out.println("Response content length: "
                        + resEntity.getContentLength());
                // 打印响应内容
                String result = EntityUtils.toString(resEntity,"utf-8");
                // 生成 JSON 对象
                obj = JSONObject.parseObject(result);
            }
            // 销毁
            EntityUtils.consume(resEntity);
        } finally {
            response.close();
        }
        return R.ok().put("result",obj);
    }
}
