package cn.yusui.xb.modules.base.entity;

import cn.yusui.xb.base.XbootBaseEntity;
import cn.yusui.xb.common.constant.CommonConstant;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

/**
 * @author linjingfeng
 */
@Data
@Entity
@Table(name = "t_role")
@TableName("t_role")
public class Role extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色名 以ROLE_开头")
    private String name;

    @ApiModelProperty(value = "是否为注册默认角色")
    private Boolean defaultRole;

    @ApiModelProperty(value = "数据权限类型 0全部默认 1自定义")
    private Integer dataType = CommonConstant.DATA_TYPE_ALL;

    @ApiModelProperty(value = "备注")
    private String description;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "拥有权限")
    private List<RolePermission> permissions;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "拥有数据权限")
    private List<RoleDepartment> departments;

    public String getName() {
        return name;
    }

    public Boolean getDefaultRole() {
        return defaultRole;
    }

    public Integer getDataType() {
        return dataType;
    }

    public String getDescription() {
        return description;
    }

    public List<RolePermission> getPermissions() {
        return permissions;
    }

    public List<RoleDepartment> getDepartments() {
        return departments;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDefaultRole(Boolean defaultRole) {
        this.defaultRole = defaultRole;
    }

    public void setDataType(Integer dataType) {
        this.dataType = dataType;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPermissions(List<RolePermission> permissions) {
        this.permissions = permissions;
    }

    public void setDepartments(List<RoleDepartment> departments) {
        this.departments = departments;
    }
}
