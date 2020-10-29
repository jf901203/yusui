package cn.yusui.xb.modules.base.dao;

import cn.yusui.xb.base.XbootBaseDao;
import cn.yusui.xb.modules.base.entity.Role;

import java.util.List;

/**
 * 角色数据处理层
 * @author linjingfeng
 */
public interface RoleDao extends XbootBaseDao<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
