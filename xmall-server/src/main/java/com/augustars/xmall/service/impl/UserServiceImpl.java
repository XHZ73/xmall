package com.augustars.xmall.service.impl;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.augustars.xmall.entity.User;
import com.augustars.xmall.service.UserService;
@Service("userService")
@com.alibaba.dubbo.config.annotation.Service(version="1.0.0")
@Transactional
public class UserServiceImpl implements UserService {

}
