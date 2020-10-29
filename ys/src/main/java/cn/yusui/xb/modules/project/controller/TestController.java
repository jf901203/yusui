package cn.yusui.xb.modules.project.controller;

import cn.yusui.xb.common.utils.PageUtil;
import cn.yusui.xb.common.utils.ResultUtil;
import cn.yusui.xb.common.vo.PageVo;
import cn.yusui.xb.common.vo.Result;
import cn.yusui.xb.modules.project.entity.Test;
import cn.yusui.xb.modules.project.service.TestService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * @author linjinfeng
 */
@Slf4j
@RestController
@Api(description = "测试表管理接口")
@RequestMapping("/xboot/test")
@Transactional
public class TestController{

    @Autowired
    private TestService testService;

    @RequestMapping(value = "/getPage",method = RequestMethod.POST)
    @ApiOperation(value = "获取全部数据")
    public Result<Page<Test>> getAll(@ModelAttribute Test test,@ModelAttribute PageVo pageVo){

        Page<Test> page = new Page<>(pageVo.getPageNumber(),pageVo.getPageSize());
        Page<Test> testPage = testService.selectListPage(page,test);

        return new ResultUtil<Page<Test>>().setData(testPage);
    }

    @RequestMapping(value = "/saveOrUpdate",method = RequestMethod.POST)
    @ApiOperation(value = "保存修改数据")
    public Result<Object> saveOrUpdate(@ModelAttribute Test test){
        boolean bo = testService.saveOrUpdate(test);
        return new ResultUtil<Object>().setSuccessMsg("成功");
    }


    @RequestMapping(value = "/updateById",method = RequestMethod.POST)
    @ApiOperation(value = "根据id更新数据")
    public Result<Object> updateById(@ModelAttribute Test test){
        boolean bo = testService.updateById(test);
        return new ResultUtil<Object>().setSuccessMsg("成功");
    }

    @RequestMapping(value = "/removeByIds",method = RequestMethod.POST)
    @ApiOperation(value = "根据id批量删除")
    public Result<Object> removeByIds(@RequestParam("ids") List<String> Ids){
        boolean bo = testService.removeByIds(Ids);
        return new ResultUtil<Object>().setSuccessMsg("成功");
    }

}
