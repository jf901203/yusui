package cn.yusui.xb.modules.base.service;


import cn.yusui.xb.base.XbootBaseService;
import cn.yusui.xb.modules.base.entity.Role;

import java.util.List;

/**
 * 角色接口
 * @author linjingfeng
 */
public interface RoleService extends XbootBaseService<Role,String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
