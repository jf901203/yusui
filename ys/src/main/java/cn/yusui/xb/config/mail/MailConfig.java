package cn.yusui.xb.config.mail;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 邮件
 * @author linjingfeng
 */
@Component
@ConfigurationProperties(prefix="mail")
public class MailConfig {
	// 邮件发件人地址
	private String senderAddress;
	// 邮件发件人用户名
	private String senderAccount;
	// 邮件发件人密码(授权码)
	private String senderPassword;

	public String getSenderAddress() {
		return senderAddress;
	}

	public String getSenderAccount() {
		return senderAccount;
	}

	public String getSenderPassword() {
		return senderPassword;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public void setSenderAccount(String senderAccount) {
		this.senderAccount = senderAccount;
	}

	public void setSenderPassword(String senderPassword) {
		this.senderPassword = senderPassword;
	}
}
