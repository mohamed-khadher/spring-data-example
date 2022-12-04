package tn.enig.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tn.enig.model.Role;
import tn.enig.model.UserEntity;

@Service
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private IUser userRepo;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		UserEntity user = userRepo.findByUsername(username);
		if(user == null) throw new UsernameNotFoundException(username);
		for(Role role: user.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.toString()));
		}
		UserDetails userD = User.withUsername(user.getUsername())
				.password(user.getPassword())
				.authorities(authorities)
				.build();
		return userD;
	}
	
	
}
