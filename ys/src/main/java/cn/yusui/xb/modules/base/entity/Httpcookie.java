package cn.yusui.xb.modules.base.entity;

import cn.yusui.xb.common.utils.SnowFlakeUtil;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author linjinfeng
 */
@Data
@Entity
@Table(name = "t_httpcookie")
@TableName("t_httpcookie")
public class Httpcookie {

    private static final long serialVersionUID = 1L;

    @Id
    @TableId
    @ApiModelProperty(value = "唯一标识")
    private String id = String.valueOf(SnowFlakeUtil.getFlowIdInstance().nextId());

    @ApiModelProperty(value = "sessionKey")
    private String sessionKey;

    @ApiModelProperty(value = "sessionValue")
    private String sessionValue;

    @ApiModelProperty(value = "userid")
    private String userid;

    @ApiModelProperty(value = "isdelete")
    private Integer isdelete;

}