package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.entity.dto.*;
import com.example.demo.exception.ObjectExistedException;
//import com.example.demo.jwt.JwtTokenProvider;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.jwt.JwtTokenProvider;
import com.example.demo.security.UserDetail;
import com.example.demo.service.RefreshTokenService;
import com.example.demo.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin(origins = "*")
@RestController
public class UserController {
    @Autowired
    private RefreshTokenService refreshTokenService;
    @Autowired
    private JwtTokenProvider jwtTokenProvider;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserService userService;

    @GetMapping("/home")
    public String home(){
        return "public page";
    }
    @PostMapping("/api/login")
    public ResponseEntity<?> login(@RequestBody @Valid LoginRequest loginRequest){
        System.out.println("check");
        try {
            Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getUsername() , loginRequest.getPassword()));
            UserDetail user = (UserDetail) authentication.getPrincipal();
            System.out.println("ok");
            String token = jwtTokenProvider.generateToken(user);
            RefreshToken refreshToken = new RefreshToken();
            refreshToken.setUser(user.getUser());
            System.out.println(user);
            String refToken = jwtTokenProvider.refreshToken(user , refreshToken.getId());
            refreshToken.setRfToken(refToken);
            refreshTokenService.save(refreshToken);
            return new ResponseEntity<>(new ResponseUser(token , refToken, user.getUsername(), 200, (List<GrantedAuthority>) user.getAuthorities() ),HttpStatus.OK);
        }
        catch (Exception e){
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();

        }

    }

    @PostMapping("/api/signup")
    public ResponseEntity<?> create(@RequestBody @Valid SignUpRequest sign) throws ObjectExistedException {
        User user = userService.create(sign);
        UserDetail userDetail = new UserDetail();
        userDetail.setUser(user);
        String token = jwtTokenProvider.generateToken(userDetail);
        RefreshToken refreshToken = new RefreshToken();
        refreshToken.setUser(user);
        String refToken = jwtTokenProvider.refreshToken(userDetail , refreshToken.getId());
        refreshToken.setRfToken(refToken);
        refreshTokenService.save(refreshToken);
        return new ResponseEntity<>(new ResponseUser(token , refToken, user.getUsername() , 200, (List<GrantedAuthority>) userDetail.getAuthorities()),HttpStatus.OK);
    }


    @PostMapping("/api/logout")
    public ResponseEntity<?> logout(@RequestBody @Valid TokenDto tokenDto){
        if(jwtTokenProvider.validateToken(tokenDto.getRefreshToken())  && !ObjectUtils.isEmpty(refreshTokenService.findByToken(tokenDto.getRefreshToken()))){
            User user = refreshTokenService.findUserByToken(tokenDto.getRefreshToken());
            refreshTokenService.deleteAllByUserId(user.getUserId());
            return new ResponseEntity<>(new CartMessage("Logout") , HttpStatus.OK);
        }
        throw new BadCredentialsException("invalid token");
    }

    @PostMapping("/api/access-token")
    public ResponseEntity<?> accessToken(@RequestBody @Valid TokenDto tokenDto){
        String refToken = tokenDto.getRefreshToken();
        if(jwtTokenProvider.validateToken(refToken)  && !ObjectUtils.isEmpty(refreshTokenService.findByToken(refToken))){
            RefreshToken refreshToken = new RefreshToken();
            User user = refreshTokenService.findUserByToken(refToken);
            refreshToken.setUser(user);
            UserDetail userDetail = new UserDetail(user);
            String token = jwtTokenProvider.generateToken(userDetail);
            String rfToken = jwtTokenProvider.refreshToken(userDetail , refreshToken.getId());
            refreshToken.setRfToken(rfToken);
            refreshTokenService.save(refreshToken);
            refreshTokenService.deleteByRfToken(refToken);
            return new ResponseEntity<>(new ResponseUser(token , rfToken, user.getUsername(),200, (List<GrantedAuthority>) userDetail.getAuthorities()),HttpStatus.OK);
        }
        throw new BadCredentialsException("invalid token");
    }

    @GetMapping("/user")
    public ResponseEntity<?> getUser(@RequestParam(name = "page" , required = false , defaultValue = "1") int page , @RequestParam(name = "size" , required = false , defaultValue = "6") int size){
        List<User> users = userService.findAll(page,size).getContent();
        int pageCount = userService.findAll(page,size).getTotalPages();
        return new ResponseEntity<>(new UserView(pageCount,users),HttpStatus.OK);
    }
    @DeleteMapping("/user/{id}")
    public ResponseEntity<?> deleteUser(@PathVariable int id) throws UserNotFoundException {
        userService.delete(id);
        return new ResponseEntity<>(new CartMessage("delete successfully") , HttpStatus.OK);
    }
    @GetMapping("/auth")
    public String authen(){
        return "Authenticated page";
    }
    @GetMapping("/admin")
    public String admin(){
        return "Admin page";
    }
    @GetMapping("/editor")
    public String editor(){
        return "Editor page";
    }
}
