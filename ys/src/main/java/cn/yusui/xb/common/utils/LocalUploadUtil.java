package cn.yusui.xb.common.utils;

import cn.yusui.xb.config.exception.XbootException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * Created by Administrator on 2019/1/10 0010.
 */
@Slf4j
@Component
public class LocalUploadUtil {

    /**
     * @param
     * @author linjingfeng
     * @Description 文件上传
     * @date date 2017-7-20
     */
    public String uploadFile(byte[] fileByte, String fileName,String Path) {
        String fileUrl =null;
        try {
            FileUtil.uploadFile(fileByte,fileName,Path);
            fileUrl = "http://localhost:8888/images/"+fileName;
        } catch (Exception e) {
            e.printStackTrace();
            throw new XbootException("上传失败");
        }
        return fileUrl;
    }
}
