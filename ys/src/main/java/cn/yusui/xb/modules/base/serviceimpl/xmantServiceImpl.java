package cn.yusui.xb.modules.base.serviceimpl;

import cn.yusui.xb.modules.base.dao.xmantDao;
import cn.yusui.xb.modules.base.entity.xmant;
import cn.yusui.xb.modules.base.service.xmantService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 测试表接口实现
 * @author linjinfeng
 */
@Slf4j
@Service
@Transactional
public class xmantServiceImpl implements xmantService {

    @Autowired
    private xmantDao xmantDao;

    @Override
    public xmantDao getRepository() {
        return xmantDao;
    }
}