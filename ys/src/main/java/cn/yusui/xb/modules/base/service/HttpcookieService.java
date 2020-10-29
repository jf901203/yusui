package cn.yusui.xb.modules.base.service;

import cn.yusui.xb.modules.base.entity.Httpcookie;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * cookie表接口
 * @author linjinfeng
 */
public interface HttpcookieService extends IService<Httpcookie> {

     Page<Httpcookie> selectListPage(Page page, Httpcookie httpcookie);

}