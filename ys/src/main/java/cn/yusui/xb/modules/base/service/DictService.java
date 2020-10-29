package cn.yusui.xb.modules.base.service;

import cn.yusui.xb.base.XbootBaseService;
import cn.yusui.xb.modules.base.entity.Dict;

import java.util.List;

/**
 * 字典接口
 * @author linjingfeng
 */
public interface DictService extends XbootBaseService<Dict,String> {

    /**
     * 通过type获取
     * @param type
     * @return
     */
    Dict findByType(String type);

    /**
     * 模糊搜索
     * @param key
     * @return
     */
    List<Dict> findByTitleOrTypeLike(String key);
}