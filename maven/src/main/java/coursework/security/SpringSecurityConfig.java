package coursework.security;

import coursework.security.jwt.JWTSecurityConfigurer;
import coursework.security.jwt.JWTTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  private JWTTokenProvider jwtTokenProvider;

  @Bean
  @Override
  public AuthenticationManager authenticationManagerBean() throws Exception {
    return super.authenticationManagerBean();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.httpBasic().disable()
        .csrf().disable()
        .formLogin().disable()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        .and()
        .authorizeRequests()
        .antMatchers("/auth").permitAll()
        .antMatchers(HttpMethod.GET,
            "/bookTypes", "/bookType/{id}",
            "/books", "/book/{id}",
            "/clients", "/client{id}",
            "/journals", "/journal{id}").permitAll()
        .antMatchers(HttpMethod.POST, "/addBook", "/addClient").hasRole("USER")
        .antMatchers(HttpMethod.PUT, "/updateBook{id}", "updateClient{id}").hasRole("USER")
        .antMatchers(HttpMethod.DELETE, "/deleteBook{id}", "/deleteClient{id}").hasRole("USER")
        .antMatchers(HttpMethod.POST, "/addBook", "/addClient", "/addBookType", "/addJournal")
        .hasRole("ADMIN")
        .antMatchers(HttpMethod.PUT, "/updateBook{id}", "updateClient{id}", "/updateBookType{id}",
            "/updateJournal{id}").hasRole("ADMIN")
        .antMatchers(HttpMethod.DELETE, "/deleteBook{id}", "/deleteClient{id}",
            "/deleteBookType{id}", "deleteJournal{id}")
        .hasRole("ADMIN")
        .anyRequest().authenticated()
        .and()
        .apply(new JWTSecurityConfigurer(jwtTokenProvider));
  }
}
