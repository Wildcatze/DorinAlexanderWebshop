package com.example.demo.controller;
import com.example.demo.model.Account;
import com.example.demo.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller

public class NavigationController {
    @GetMapping("/displayListings")
    public String displayListing(){
        return "/displayListings";
    }

    @GetMapping("/createListing")
    public String createListing(){
        return "/createListing";
    }
}
