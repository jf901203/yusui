package cn.yusui.xb.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author linjingfeng
 */
@Data
public class SearchVo implements Serializable {

    private String startDate;

    private String endDate;
}
