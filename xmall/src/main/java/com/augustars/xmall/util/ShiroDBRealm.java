package com.augustars.xmall.util;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.alibaba.dubbo.config.annotation.Reference;
import com.augustars.xmall.entity.User;
import com.augustars.xmall.service.UserService;

public class ShiroDBRealm extends AuthorizingRealm {
	@Reference(version="1.0.0")
	private UserService userService;

	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection collection) {
		return null;
	}

	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// 进行token的类型转换
		UsernamePasswordToken userToken = (UsernamePasswordToken) token;
		// 获得用户登录名
		String loginName = userToken.getUsername();
		// 对密码进行加密，并且重新设定会token
		userToken.setPassword(EncryptionUtil.encrypt(
				new String(userToken.getPassword())).toCharArray());
		// 使用Service进行查询
		try {
			User user = userService.getUserByLogin(loginName);
			System.out.println(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
