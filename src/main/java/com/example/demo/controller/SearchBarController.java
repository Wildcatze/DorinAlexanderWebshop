package com.example.demo.controller;

import com.example.demo.model.Listing;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.ListingRepository;
import com.example.demo.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//Pagination, Sorting & Filtering
@RestController
@RequestMapping("/search")
public class SearchBarController {

    @Autowired
    ListingRepository listingRepository;

    @Autowired
    TypeRepository typeRepository;

    @Autowired
    AccountRepository accountRepository;

    //Listing Search
    @GetMapping("/listings")
    public ResponseEntity<Map<String, Object>> getPageOfListings(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "3") int size) { //Change The Default Size to bigger once we have more listings

        Pageable paging = PageRequest.of(page, size);

        Page<Listing> pageListings = listingRepository.findAll(paging);

        List<Listing> listings = pageListings.getContent();

        if (listings.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        Map<String, Object> response = new HashMap<>();
        response.put("Total Listings", pageListings.getTotalElements());
        response.put("Listings", listings);
        response.put("Current Page", pageListings.getNumber());
        response.put("Total Pages", pageListings.getTotalPages());

        return new ResponseEntity<>(response, HttpStatus.OK);


    }

    //Listing Search By Title
    @GetMapping("/listings/{title}")
    public ResponseEntity<Map<String, Object>> getPageOfListingsWithTitle(
            @PathVariable String title,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "3") int size) { //Change The Default Size to bigger once we have more listings

        Pageable paging = PageRequest.of(page, size);

        Page<Listing> pageListings = listingRepository.findByTitleContaining(title, paging);

        List<Listing> listings = pageListings.getContent();

        if (listings.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        Map<String, Object> response = new HashMap<>();
        response.put("Total Listings", pageListings.getTotalElements());
        response.put("Listings", listings);
        response.put("Current Page", pageListings.getNumber());
        response.put("Total Pages", pageListings.getTotalPages());

        return new ResponseEntity<>(response, HttpStatus.OK);


    }





}
