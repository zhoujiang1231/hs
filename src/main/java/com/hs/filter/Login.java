package com.hs.filter;

import com.hs.service.RedisService;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zj on 2018年1年25日.
 */
@WebFilter(filterName = "Login",urlPatterns = "/*")
public class Login implements Filter {
    private RedisService redisService;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String sessionId= request.getRequestedSessionId();
        String s = redisService.get(sessionId);
        if(1==1){
            response.getWriter().print("返回");
            return;
        }
        else {
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        redisService = (RedisService) WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext()).getBean("redisService");
    }


}
