package com.javaweb.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // map tat ca request /uploads/** toi thu muc D:/Uploads/
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:/D:/SpringBoot/uploads/");


    }
}
