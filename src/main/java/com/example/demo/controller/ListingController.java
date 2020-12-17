package com.example.demo.controller;


import com.example.demo.model.Listing;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.ListingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
public class ListingController {

    @Autowired
    ListingRepository listingRepository;

    @Autowired
    AccountRepository accountRepository;

//    @GetMapping("/displayListings")
//    public String displayListings (Model model){
//        model.addAttribute("listing", ListingController.modelListing())
//        return "/displayListings";
//    }


    //All listings
    /*
    @GetMapping("/listings")
    public ResponseEntity<List<Listing>> getAllListings(@RequestParam(required = false)String id) {
        List<Listing> listings = new ArrayList<>();
        listings = listingRepository.findAll();
        return new ResponseEntity<>(listings, HttpStatus.OK);
    }
    /
     */

    //Show Listing by ID

}

