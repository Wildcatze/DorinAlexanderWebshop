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
import java.util.Optional;

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
            @RequestParam(name = "page",defaultValue = "0") int page,
            @RequestParam(name = "size") int size) { //Change The Default Size to bigger once we have more listings

        Pageable paging = PageRequest.of(page, size);

        Page<Listing> pageListings = listingRepository.findAll(paging);

        List<Listing> listings = pageListings.getContent();

        if (listings.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);

        Map<String, Object> response = new HashMap<>();
        response.put("totalListings", pageListings.getTotalElements());
        response.put("listings", listings);
        response.put("currentPage", pageListings.getNumber());
        response.put("totalPages", pageListings.getTotalPages());

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
        response.put("totalListings", pageListings.getTotalElements());
        response.put("listings", listings);
        response.put("currentPage", pageListings.getNumber());
        response.put("totalPages", pageListings.getTotalPages());

        return new ResponseEntity<>(response, HttpStatus.OK);

    }
    @GetMapping("/getOne/{listing_id}")
    public ResponseEntity<Listing> getListingById(@PathVariable("listing_id") int listingId) {
        Optional<Listing> _listing = listingRepository.findById(listingId);
        return new ResponseEntity<>(_listing.get(), HttpStatus.OK);
    }

    //Create Listing
    @PostMapping("/create")
    public ResponseEntity<Listing> createListing(@RequestBody Listing listing) {
        Listing _listing = listingRepository.save(listing);
        return new ResponseEntity<>(_listing, HttpStatus.CREATED);
    }

    //Update Listing Fields By Id
    @PutMapping("/update/{listingId}")
    public ResponseEntity<Listing> updateListing(@PathVariable("listingId") int listingId, @RequestBody Listing listing) {
        Optional<Listing> listingData = listingRepository.findById(listingId);
        Listing _listing = listingData.get();
        _listing.setDescription(listing.getDescription());
        _listing.setTitle(listing.getTitle());
        _listing.setItemCondition(listing.getItemCondition());
        _listing.setPrice(listing.getPrice());
        _listing.setDate(listing.getDate());
        _listing.setTypeId(listing.getTypeId());
        _listing.setAccountId(listing.getAccountId());
        return new ResponseEntity<>(listingRepository.save(_listing), HttpStatus.OK);

    }



    //Delete Listing by Id
    @DeleteMapping("/delete/{listingId}")
    public ResponseEntity<HttpStatus> deleteListing(@PathVariable("listingId") int listingId) {
        listingRepository.deleteById(listingId);
        return new ResponseEntity<>(HttpStatus.OK);
    }





}
