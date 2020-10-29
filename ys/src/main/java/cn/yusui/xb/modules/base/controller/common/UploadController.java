package cn.yusui.xb.modules.base.controller.common;

import cn.yusui.xb.common.limit.RedisRaterLimiter;
import cn.yusui.xb.common.utils.IpInfoUtil;
import cn.yusui.xb.common.utils.LocalUploadUtil;
import cn.yusui.xb.common.utils.QiniuUtil;
import cn.yusui.xb.common.utils.ResultUtil;
import cn.yusui.xb.common.vo.Result;
import cn.yusui.xb.config.exception.XbootException;
import cn.hutool.core.util.StrUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author linjingfeng
 */
@Slf4j
@RestController
@Api(description = "文件上传接口")
@RequestMapping("/xboot/upload")
@Transactional
public class UploadController {

    @Autowired
    private RedisRaterLimiter redisRaterLimiter;

    @Autowired
    private QiniuUtil qiniuUtil;
    @Autowired
    private LocalUploadUtil localUploadUtil;

    @Autowired
    private IpInfoUtil ipInfoUtil;

    //后台图片保存地址
    @Value("${cbs.imagesPath}")
    private String imghost;
   // private String imghost = System.getProperty("user.dir")+"\\upload\\";

    @RequestMapping(value = "/file",method = RequestMethod.POST)
    @ApiOperation(value = "文件上传")
    public Result<Object> upload(@RequestParam("file") MultipartFile file,
                                 HttpServletRequest request) {

        // IP限流 在线Demo所需 5分钟限1个请求
        String token = redisRaterLimiter.acquireTokenFromBucket("upload:"+ipInfoUtil.getIpAddr(request), 1, 3000);
        if (StrUtil.isBlank(token)) {
            throw new XbootException("上传那么多干嘛，等等再传吧");
        }

        String result = null;
        String fileName = qiniuUtil.renamePic(file.getOriginalFilename());
        try {
            FileInputStream inputStream = (FileInputStream) file.getInputStream();
            //上传七牛云服务器
            // result = qiniuUtil.qiniuInputStreamUpload(inputStream,fileName);
            //上传至本地
            String Path = imghost+ "/";
            result = localUploadUtil.uploadFile(file.getBytes(),fileName,Path);

        } catch (Exception e) {
            log.error(e.toString());
            return new ResultUtil<Object>().setErrorMsg(e.toString());
        }
        return new ResultUtil<Object>().setData(result);
    }
}
