package cn.yusui.xb.modules.project.entity;

import cn.yusui.xb.base.XbootBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author linjinfeng
 */
@Data
@Entity
@Table(name = "t_test")
@TableName("t_test")
public class Test extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "名称")
    private String name;
}