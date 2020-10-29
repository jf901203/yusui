package cn.yusui.xb.modules.base.service;

import cn.yusui.xb.base.XbootBaseService;
import cn.yusui.xb.modules.base.entity.RoleDepartment;

import java.util.List;

/**
 * 角色部门接口
 * @author linjingfeng
 */
public interface RoleDepartmentService extends XbootBaseService<RoleDepartment,String> {

    /**
     * 通过roleId获取
     * @param roleId
     * @return
     */
    List<RoleDepartment> findByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param departmentId
     */
    void deleteByDepartmentId(String departmentId);
}