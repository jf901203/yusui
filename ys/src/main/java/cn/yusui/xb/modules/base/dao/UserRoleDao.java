package cn.yusui.xb.modules.base.dao;

import cn.yusui.xb.base.XbootBaseDao;
import cn.yusui.xb.modules.base.entity.UserRole;

import java.util.List;

/**
 * 用户角色数据处理层
 * @author linjingfeng
 */
public interface UserRoleDao extends XbootBaseDao<UserRole,String> {

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
