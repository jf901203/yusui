package cn.yusui.xb.modules.base.serviceimpl;

import cn.yusui.xb.modules.base.dao.mapper.HttpcookieMapper;
import cn.yusui.xb.modules.base.entity.Httpcookie;
import cn.yusui.xb.modules.base.service.HttpcookieService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * cookie表接口实现
 * @author linjinfeng
 */
@Slf4j
@Service
@Transactional
public class HttpcookieServiceImpl extends ServiceImpl<HttpcookieMapper,Httpcookie> implements HttpcookieService {

    @Autowired
    private HttpcookieMapper httpcookieMapper;

    @Override
        public Page<Httpcookie> selectListPage(Page page, Httpcookie httpcookie) {
            return page.setRecords(httpcookieMapper.selectListPage(page,httpcookie));
        }
}