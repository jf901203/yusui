package cn.yusui.xb.modules.base.dao.mapper;

import cn.yusui.xb.modules.base.entity.Httpcookie;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * cookie表数据处理层
 * @author linjinfeng
 */
public interface HttpcookieMapper extends BaseMapper<Httpcookie> {

      List<Httpcookie> selectListPage(Page<Httpcookie> pagination, @Param(value = "Httpcookie") Httpcookie httpcookie);
}