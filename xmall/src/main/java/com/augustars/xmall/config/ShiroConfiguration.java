package com.augustars.xmall.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource(locations= {"classpath:/config/applicationContext-shiro.xml"})
public class ShiroConfiguration {

}
