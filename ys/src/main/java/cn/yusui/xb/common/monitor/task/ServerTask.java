/*
package cn.yusui.xb.common.monitor.task;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.json.JSONUtil;
import cn.yusui.xb.common.monitor.common.WebSocketConsts;
import cn.yusui.xb.common.monitor.model.Server;
import cn.yusui.xb.common.monitor.payload.ServerVO;
import cn.yusui.xb.common.utils.ServerUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

*/
/**
 * <p>
 * 服务器定时推送任务
 * </p>
 *
 * @package: cn.yusui.xb.common.monitor.task
 * @description: 服务器定时推送任务
 * @author: linjingfeng
 * @date: Created in 2018-12-14 16:04
 * @copyright: Copyright (c) 2018
 * @version: V1.0
 * @modified: linjingfeng
 *//*

@Slf4j
@Component
public class ServerTask {
    @Autowired
    private SimpMessagingTemplate wsTemplate;

    */
/**
     * 按照标准时间来算，每隔 2s 执行一次
     *//*

    @Scheduled(cron = "0/2 * * * * ?")
    public void websocket() throws Exception {
       // log.info("【推送消息】开始执行：{}", DateUtil.formatDateTime(new Date()));
        // 查询服务器状态
        Server server = new Server();
        server.copyTo();
        ServerVO serverVO = ServerUtil.wrapServerVO(server);
        Dict dict = ServerUtil.wrapServerDict(serverVO);
        wsTemplate.convertAndSend(WebSocketConsts.PUSH_SERVER, JSONUtil.toJsonStr(dict));
       // log.info("【推送消息】执行结束：{}", DateUtil.formatDateTime(new Date()));
    }
}
*/
