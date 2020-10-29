package cn.yusui.xb.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author linjingfeng
 */
@Data
public class City implements Serializable {

    String country;

    String province;

    String city;
}
