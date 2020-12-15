package com.example.demo.controller;


import com.example.demo.model.Listing;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.ListingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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


    //All listings
    @GetMapping("/listings")
    public ResponseEntity<List<Listing>> getAllListings(@RequestParam(required = false)String id) {
        List<Listing> listings = new ArrayList<>();
        listings = listingRepository.findAll();
        return new ResponseEntity<>(listings, HttpStatus.OK);
    }

    //Show Listing by ID
    @GetMapping("/listings/{listingId}")
    public ResponseEntity<Listing> getListingById(@PathVariable("listingId") int listingId) {
        Optional<Listing> _listing = listingRepository.findById(listingId);
        return new ResponseEntity<>(_listing.get(), HttpStatus.OK);
    }

    //Create Listing
    @PostMapping("/listings")
    public ResponseEntity<Listing> createListing(@RequestBody Listing listing) {
        Listing _listing = listingRepository.save(listing);
        return new ResponseEntity<>(_listing, HttpStatus.CREATED);
    }

    //Update Listing Fields By Id
    @PutMapping("/listings/{listingId}")
    public ResponseEntity<Listing> updateListing(@PathVariable("listingId") int listingId, @RequestBody Listing listing) {
        Optional<Listing> listingData = listingRepository.findById(listingId);
        Listing _listing = listingData.get();
        _listing.setTitle(listing.getTitle());
        _listing.setItemCondition(listing.getItemCondition());
        _listing.setPrice(listing.getPrice());
        _listing.setDate(listing.getDate());
        _listing.setTypeId(listing.getTypeId());
        _listing.setAccountId(listing.getAccountId());
        return new ResponseEntity<>(listingRepository.save(_listing), HttpStatus.OK);

    }



    //Delete Listing by Id
    @DeleteMapping("/listings/{listingId}")
    public ResponseEntity<HttpStatus> deleteListing(@PathVariable("listingId") int listingId) {
        listingRepository.deleteById(listingId);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}

