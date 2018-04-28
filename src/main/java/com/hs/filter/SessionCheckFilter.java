package com.hs.filter;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author: zj
 * @Date: 2018年4年26日
 **/
@WebFilter(urlPatterns = "*",filterName = "sessionCheck")
public class SessionCheckFilter implements Filter {

    @Resource
    private RedisTemplate redisTemplate;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String currPath = request.getRequestURI();
        HttpSession session = request.getSession();
        boolean flag = redisTemplate.hasKey(session.getId()+"user_type");
        if (flag || StringUtils.containsIgnoreCase(currPath, "login")
                || currPath.equals("/") ){

            filterChain.doFilter(request, response);
        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().append("{\"result\":\"10\",\"msg\":\"当前无用户登录\"}");
            return;
        }
    }

    @Override
    public void destroy() {

    }
}
