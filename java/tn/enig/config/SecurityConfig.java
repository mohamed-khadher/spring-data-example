package tn.enig.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
    public DaoAuthenticationProvider authProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(cryptageMP());
        return authProvider;
    }
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.formLogin();
		http.authorizeRequests().antMatchers("/removeMateriel**").hasAuthority("Admin").and()
	      .exceptionHandling().accessDeniedPage("/forbidden");;
		http.authorizeRequests()
			.antMatchers("/formMateriel*", "/AddMateriel", "/ListeDepartementMateriel*", "/")
			.hasAnyAuthority("Admin","Agent").and()
		    .exceptionHandling().accessDeniedPage("/forbidden");;
		http.authorizeRequests().antMatchers("/home**")
			.hasAnyAuthority("User", "Admin", "Agent").and()
			.exceptionHandling().accessDeniedPage("/forbidden");;
		http.authorizeRequests().anyRequest().authenticated();
		http.csrf().disable(); //Rejecting POST requests for some reason...
	}
	@Bean
	public PasswordEncoder cryptageMP() {
		return new BCryptPasswordEncoder();
	}
}
