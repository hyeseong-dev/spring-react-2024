package com.example.board_back.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.example.board_back.provider.JwtProvider;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtProvider jwtProvider;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String token = parseBearerToken(request); // 1. Bearer 토큰을 파싱

        if (StringUtils.hasText(token) && validateToken(token)) { // 2. 토큰이 유효한 경우
            setAuthentication(token, request); // 3. 인증 객체 설정
        }

        filterChain.doFilter(request, response); // 4. 필터 체인 계속
    }

    /**
     * Bearer 토큰을 파싱하여 반환합니다.
     * @param request HTTP 요청 객체
     * @return JWT 토큰 문자열 또는 null
     */
    private String parseBearerToken(HttpServletRequest request) {
        String authorization = request.getHeader("Authorization");
        if (StringUtils.hasText(authorization) && authorization.startsWith("Bearer ")) {
            return authorization.substring(7); // "Bearer " 제거 후 반환
        }
        return null;
    }

    /**
     * JWT 토큰을 검증합니다.
     * @param token JWT 토큰 문자열
     * @return 토큰이 유효한지 여부
     */
    private boolean validateToken(String token) {
        return jwtProvider.validate(token) != null; // 유효한 토큰인지 검증
    }

    /**
     * 유효한 JWT 토큰이 있을 경우 SecurityContext에 인증 객체를 설정합니다.
     * @param token JWT 토큰 문자열
     * @param request HTTP 요청 객체
     */
    private void setAuthentication(String token, HttpServletRequest request) {
        String email = jwtProvider.validate(token); // 이메일 추출
        AbstractAuthenticationToken authentication = 
                new UsernamePasswordAuthenticationToken(email, null, AuthorityUtils.NO_AUTHORITIES);
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        
        SecurityContext context = SecurityContextHolder.createEmptyContext();
        context.setAuthentication(authentication);
        SecurityContextHolder.setContext(context); // SecurityContextHolder에 인증 설정 저장
    }
}
