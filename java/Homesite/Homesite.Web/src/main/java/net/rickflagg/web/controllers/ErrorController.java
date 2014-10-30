package net.rickflagg.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Author: Rick Flagg
 * Date: 10/30/14
 * Time: 4:29 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Controller
public class ErrorController {

    @RequestMapping("error")
    public String customError(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "error";
    }

}
