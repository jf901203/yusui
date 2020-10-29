package cn.yusui.xb.modules.base.controller;

import cn.yusui.xb.base.XbootBaseController;
import cn.yusui.xb.common.utils.PageUtil;
import cn.yusui.xb.common.utils.ResultUtil;
import cn.yusui.xb.common.vo.PageVo;
import cn.yusui.xb.common.vo.Result;
import cn.yusui.xb.modules.base.entity.Dict;
import cn.yusui.xb.modules.base.entity.xmant;
import cn.yusui.xb.modules.base.service.xmantService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author linjinfeng
 */
@Slf4j
@RestController
@Api(description = "测试表管理接口")
@RequestMapping("/test")
@Transactional
public class xmantController{

    @Autowired
    private xmantService xmantService;

    @RequestMapping(value = "/getAll",method = RequestMethod.POST)
    @ApiOperation(value = "获取全部数据")
    public Result<Object> getAll(@ModelAttribute xmant xmant){
         xmantService.save(xmant);
        return new ResultUtil<Object>().setSuccessMsg("添加成功");
    }
}
