package org.mvc.security;

import java.util.stream.Collectors;

import org.mvc.domain.MemberVO;
import org.mvc.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class CustomUserDetailService implements UserDetailsService {
    
    @Setter(onMethod_= {@Autowired})
    private MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String mid) throws UsernameNotFoundException {
        
        log.info("loadUserByUserName: "+ mid);
        
        MemberVO vo = mapper.readMember(mid);
        
        User user = new User(vo.getMid(), vo.getMpw(), vo.getAuthList().stream().map(authVO -> new SimpleGrantedAuthority(authVO.getAuth())).collect(Collectors.toList()));
        
        return user;
    }

}