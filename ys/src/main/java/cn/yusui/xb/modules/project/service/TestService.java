package cn.yusui.xb.modules.project.service;

import cn.yusui.xb.modules.project.entity.Test;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 测试表接口
 * @author linjinfeng
 */
public interface TestService extends IService<Test> {

     Page<Test> selectListPage(Page page,Test test);

}