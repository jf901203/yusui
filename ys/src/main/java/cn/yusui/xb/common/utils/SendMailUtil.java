package cn.yusui.xb.common.utils;


import cn.yusui.xb.config.mail.MailConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import java.util.Date;
import java.util.Properties;

/**
 * @author linjingfeng
 */
@Component
public class SendMailUtil {

    @Autowired
    private MailConfig mailConfig;

    /**
     * @param recipientAddresslist  接收人(多人)
     * @param Subject     邮件标题
     * @param content     邮件内容
     * @param imagelist   图片数组
     * @param annexlist   附件数组
     */
    public void SendMailText_Picture_Enclosure(String recipientAddresslist,String Subject,String content,String [] imagelist,String [] annexlist) throws Exception {
        //1、连接邮件服务器的参数配置
        Properties props = new Properties();
        //设置用户的认证方式
        props.setProperty("mail.smtp.auth", "true");
        //设置传输协议
        props.setProperty("mail.transport.protocol", "smtp");
        //设置发件人的SMTP服务器地址
        props.setProperty("mail.smtp.host", "smtp.qq.com");
        //2、创建定义整个应用程序所需的环境信息的 Session 对象
        Session session = Session.getInstance(props);
        //设置调试信息在控制台打印出来
        session.setDebug(true);

/*
        //接收人(多人)
        String  recipientAddresslist = "2521313275@qq.com,652210786@qq.com,lin652210786@163.com,519052532@qq.com,1126953843@qq.com";
        //邮件标题
        String Subject = "下班通知";
        //邮件内容
        String content ="今晚早点搞完下班了，gogogo!!!<br/>";
        //图片数组
        String [] imagelist = new String[] {"C:\\Users\\Administrator\\Desktop\\1.png","C:\\Users\\Administrator\\Desktop\\2.png"};
        //附件数组
        String [] annexlist = new String[]{"C:\\Users\\Administrator\\Desktop\\2.png","C:\\Users\\Administrator\\Desktop\\1.png"};
*/

        //3、创建邮件的实例对象
        Message msg = getMimeMessage(session,recipientAddresslist,Subject,imagelist,content,annexlist);
        //4、根据session对象获取邮件传输对象Transport
        Transport transport = session.getTransport();
        //设置发件人的账户名和密码
        transport.connect(mailConfig.getSenderAccount(), mailConfig.getSenderPassword());
        //发送邮件，并发送到所有收件人地址，message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(msg,msg.getAllRecipients());

        //5、关闭邮件连接
        transport.close();
    }

    /**
     * 获得创建邮件的实例对象
     * @param session session
     * @param recipientAddresslist  接收人(多人)
     * @param Subject     邮件标题
     * @param imagelist   图片数组
     * @param content     邮件内容
     * @param annexlist   附件数组
     * @return MimeMessage
     * @throws MessagingException
     * @throws AddressException
     */
    public MimeMessage getMimeMessage(Session session,String recipientAddresslist,String Subject,String [] imagelist,String content,String [] annexlist) throws Exception{
        //1.创建一封邮件的实例对象
        MimeMessage msg = new MimeMessage(session);
        //2.设置发件人地址
        msg.setFrom(new InternetAddress(mailConfig.getSenderAddress()));
        /**
         * 3.设置收件人地址（可以增加多个收件人、抄送、密送），即下面这一行代码setRecipient单人 setRecipients 多人
         * MimeMessage.RecipientType.TO:发送
         * MimeMessage.RecipientType.CC：抄送
         * MimeMessage.RecipientType.BCC：密送
         */
        InternetAddress[] sendTo = InternetAddress.parse(recipientAddresslist);
        msg.setRecipients(MimeMessage.RecipientType.TO, sendTo);

        //4.设置邮件主题
        msg.setSubject(Subject,"UTF-8");

        //下面是设置邮件正文
       // msg.setContent("简单的纯文本邮件！", "text/html;charset=UTF-8");

        String imglook = "";
        MimeMultipart mm_text_image = new MimeMultipart();
        for (int j = 0;j < imagelist.length;j++){
            // 5. 创建图片"节点"
            MimeBodyPart image = new MimeBodyPart();
            // 读取本地文件
            DataHandler dh = new DataHandler(new FileDataSource(imagelist[j]));
            // 将图片数据添加到"节点"
            image.setDataHandler(dh);
            // 为"节点"设置一个唯一编号（在文本"节点"将引用该ID）
            image.setContentID("mailTestPic"+j);
            mm_text_image.addBodyPart(image);
            imglook += "<img src='cid:mailTestPic"+j+"'/>";
        }
        // 6. 创建文本"节点"
        MimeBodyPart text = new MimeBodyPart();
        // 这里添加图片的方式是将整个图片包含到邮件内容中, 实际上也可以以 http 链接的形式添加网络图片
        text.setContent(content+imglook, "text/html;charset=UTF-8");

        // 7. （文本+图片）设置 文本 和 图片"节点"的关系（将 文本 和 图片"节点"合成一个混合"节点"）
        mm_text_image.addBodyPart(text);
        mm_text_image.setSubType("related");    // 关联关系

        // 8. 将 文本+图片 的混合"节点"封装成一个普通"节点"
        // 最终添加到邮件的 Content 是由多个 BodyPart 组成的 Multipart, 所以我们需要的是 BodyPart,
        // 上面的 mailTestPic 并非 BodyPart, 所有要把 mm_text_image 封装成一个 BodyPart
        MimeBodyPart text_image = new MimeBodyPart();
        text_image.setContent(mm_text_image);

        MimeMultipart mm = new MimeMultipart();

        for(int k = 0 ;k < annexlist.length ; k++){
            // 9. 创建附件"节点"
            MimeBodyPart attachment = new MimeBodyPart();
            // 读取本地文件
            DataHandler dh2 = new DataHandler(new FileDataSource(annexlist[k]));
            // 将附件数据添加到"节点"
            attachment.setDataHandler(dh2);
            // 设置附件的文件名（需要编码）
            attachment.setFileName(MimeUtility.encodeText(dh2.getName()));

            mm.addBodyPart(attachment);     // 如果有多个附件，可以创建多个多次添加
        }

        // 10. 设置（文本+图片）和 附件 的关系（合成一个大的混合"节点" / Multipart ）
        mm.addBodyPart(text_image);
        mm.setSubType("mixed");         // 混合关系


        // 11. 设置整个邮件的关系（将最终的混合"节点"作为邮件的内容添加到邮件对象）
        msg.setContent(mm);
        //设置邮件的发送时间,默认立即发送
        msg.setSentDate(new Date());
        return msg;
    }

}
