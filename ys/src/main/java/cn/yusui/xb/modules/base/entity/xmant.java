package cn.yusui.xb.modules.base.entity;

import cn.yusui.xb.base.XbootBaseEntity;
import cn.yusui.xb.common.utils.YuSuiExcelParam;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author linjinfeng
 */
@Data
@Entity
@Table(name = "t_xmant")
@TableName("t_xmant")
public class xmant extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "名称")
    @Column(length = 18,nullable = true)
    private String name;

}