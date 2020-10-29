package cn.yusui.xb.config.exception;

import lombok.Data;

/**
 * @author linjingfeng
 */
@Data
public class XbootException extends RuntimeException {

    private String msg;

    public XbootException(String msg){
        super(msg);
        this.msg = msg;
    }
}
