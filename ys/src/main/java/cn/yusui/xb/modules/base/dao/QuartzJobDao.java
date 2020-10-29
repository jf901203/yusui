package cn.yusui.xb.modules.base.dao;

import cn.yusui.xb.base.XbootBaseDao;
import cn.yusui.xb.modules.base.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务数据处理层
 * @author linjingfeng
 */
public interface QuartzJobDao extends XbootBaseDao<QuartzJob,String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}