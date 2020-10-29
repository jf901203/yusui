package cn.yusui.xb.modules.base.controller.common;

import cn.yusui.xb.common.annotation.SystemLog;
import cn.yusui.xb.common.utils.ResultUtil;
import cn.yusui.xb.common.vo.PageVo;
import cn.yusui.xb.common.vo.Result;
import cn.yusui.xb.modules.base.entity.Httpcookie;
import cn.yusui.xb.modules.base.service.HttpcookieService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author linjinfeng
 */
@Slf4j
@RestController
@Api(description = "cookie表管理接口")
@RequestMapping("/xboot/httpcookie")
@Transactional
public class HttpcookieController {

    @Autowired
    private HttpcookieService httpcookieService;

    @RequestMapping(value = "/getPage",method = RequestMethod.POST)
    @ApiOperation(value = "获取全部数据")
    public Result<Page<Httpcookie>> getAll(@ModelAttribute Httpcookie httpcookie,@ModelAttribute PageVo pageVo){

        Page<Httpcookie> page = new Page<>(pageVo.getPageNumber(),pageVo.getPageSize());
        Page<Httpcookie> httpcookiePage = httpcookieService.selectListPage(page,httpcookie);

        return new ResultUtil<Page<Httpcookie>>().setData(httpcookiePage);
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ApiOperation(value = "保存数据")
    @SystemLog(description = "保存cookie表数据")
    public Result<Object> saveOrUpdate(@ModelAttribute Httpcookie httpcookie){
        boolean bo = httpcookieService.save(httpcookie);
        return new ResultUtil<Object>().setSuccessMsg("成功");
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ApiOperation(value = "更新数据")
    @SystemLog(description = "更新cookie表数据")
    public Result<Object> updateById(@ModelAttribute Httpcookie httpcookie){
        boolean bo = httpcookieService.updateById(httpcookie);
        return new ResultUtil<Object>().setSuccessMsg("成功");
    }

    @RequestMapping(value = "/removeByIds",method = RequestMethod.POST)
    @ApiOperation(value = "根据id批量删除")
    @SystemLog(description = "根据id批量删除cookie表数据")
    public Result<Object> removeByIds(@RequestParam("ids") List<String> Ids){
        boolean bo = httpcookieService.removeByIds(Ids);
        return new ResultUtil<Object>().setSuccessMsg("成功");
    }

}
