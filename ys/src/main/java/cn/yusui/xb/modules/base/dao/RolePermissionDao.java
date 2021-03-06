package cn.yusui.xb.modules.base.dao;

import cn.yusui.xb.base.XbootBaseDao;
import cn.yusui.xb.modules.base.entity.RolePermission;

import java.util.List;

/**
 * 角色权限数据处理层
 * @author linjingfeng
 */
public interface RolePermissionDao extends XbootBaseDao<RolePermission,String> {

    /**
     * 通过permissionId获取
     * @param permissionId
     * @return
     */
    List<RolePermission> findByPermissionId(String permissionId);

    /**
     * 通过roleId获取
     * @param roleId
     */
    List<RolePermission> findByRoleId(String roleId);

    /**
     * 通过roleId删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);
}