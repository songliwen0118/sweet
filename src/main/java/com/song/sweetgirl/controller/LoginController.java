package com.song.sweetgirl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/api")
public class LoginController {

    @RequestMapping(value = "login")
    public String login() {
        return "index";
    }

}
