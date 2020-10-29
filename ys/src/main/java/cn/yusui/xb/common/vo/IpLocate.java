package cn.yusui.xb.common.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author linjingfeng
 */
@Data
public class IpLocate implements Serializable {

    private String retCode;

    private City result;
}

