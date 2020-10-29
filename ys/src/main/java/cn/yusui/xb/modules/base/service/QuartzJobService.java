package cn.yusui.xb.modules.base.service;

import cn.yusui.xb.base.XbootBaseService;
import cn.yusui.xb.modules.base.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务接口
 * @author linjingfeng
 */
public interface QuartzJobService extends XbootBaseService<QuartzJob,String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}