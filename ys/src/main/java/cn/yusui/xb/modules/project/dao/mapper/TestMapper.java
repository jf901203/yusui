package cn.yusui.xb.modules.project.dao.mapper;

import cn.yusui.xb.modules.project.entity.Test;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 测试表数据处理层
 * @author linjinfeng
 */
public interface TestMapper extends BaseMapper<Test> {

      List<Test> selectListPage(Page<Test> pagination,@Param(value = "Test") Test test);
}