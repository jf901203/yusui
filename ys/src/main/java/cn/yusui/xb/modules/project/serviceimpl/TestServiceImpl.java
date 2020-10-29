package cn.yusui.xb.modules.project.serviceimpl;

import cn.yusui.xb.modules.project.dao.mapper.TestMapper;
import cn.yusui.xb.modules.project.entity.Test;
import cn.yusui.xb.modules.project.service.TestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class TestServiceImpl extends ServiceImpl<TestMapper,Test> implements TestService {

    @Autowired
    private TestMapper testMapper;

    @Override
        public Page<Test> selectListPage(Page page, Test test) {
            return page.setRecords(testMapper.selectListPage(page,test));
        }
}