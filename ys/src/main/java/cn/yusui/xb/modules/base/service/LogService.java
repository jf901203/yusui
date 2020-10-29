package cn.yusui.xb.modules.base.service;


import cn.yusui.xb.base.XbootBaseService;
import cn.yusui.xb.common.vo.SearchVo;
import cn.yusui.xb.modules.base.entity.Log;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 日志接口
 * @author linjingfeng
 */
public interface LogService extends XbootBaseService<Log,String> {

    /**
     * 分页搜索获取日志
     * @param type
     * @param key
     * @param searchVo
     * @param pageable
     * @return
     */
    Page<Log> findByConfition(Integer type, String key, SearchVo searchVo, Pageable pageable);
    /**
     * 删除所有
     */
    void deleteAll();
}
