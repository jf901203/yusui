package cn.yusui.xb.modules.base.service;


import cn.yusui.xb.base.XbootBaseService;
import cn.yusui.xb.modules.base.entity.UserRole;

import java.util.List;

/**
 * 用户角色接口
 * @author linjingfeng
 */
public interface UserRoleService extends XbootBaseService<UserRole,String> {

    /**
     * 通过roleId查找
     * @param roleId
     * @return
     */
    List<UserRole> findByRoleId(String roleId);

    /**
     * 删除用户角色
     * @param userId
     */
    void deleteByUserId(String userId);
}
