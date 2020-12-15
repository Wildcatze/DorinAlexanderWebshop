package com.example.demo.repository;

import com.example.demo.model.Listing;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ListingRepository extends JpaRepository<Listing, Integer> {
    List<Listing> findByTitleContaining(String title);
    Page<Listing> findByTitleContaining(String title, Pageable paging);
    List<Listing> findByDescriptionContaining(String description);
}
