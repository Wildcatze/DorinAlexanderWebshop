package com.example.demo.controller;


import com.example.demo.model.Type;
import com.example.demo.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
public class TypeController {

    @Autowired
    TypeRepository typeRepository;

    //All Types
    @GetMapping("/types")
    public ResponseEntity<List<Type>> getAllTypes(@RequestParam(required = false)String id){
        List<Type> types = new ArrayList<>();
        types = typeRepository.findAll();
        return new ResponseEntity<>(types, HttpStatus.OK);
    }

    //Show Type By ID
    @GetMapping("/types/{typeId}")
    public ResponseEntity<Type> getTypeById(@PathVariable("typeId") int typeId) {
        Optional<Type> _type = typeRepository.findById(typeId);
        return new ResponseEntity<>(_type.get(), HttpStatus.OK);
    }

    //Create Type
    @PostMapping("/types")
    public ResponseEntity<Type> createType(@RequestBody Type type) {
        Type _type = typeRepository.save(type);
        return new ResponseEntity<>(_type, HttpStatus.CREATED);
    }

    //Update Type fields by Id
    @PutMapping("/types/{typeId}")
    public ResponseEntity<Type> updateType(@PathVariable("typeId") int typeId, @RequestBody Type type) {
        Optional<Type> typeData = typeRepository.findById(typeId);
        Type _type = typeData.get();
        _type.setName(type.getName());
        return new ResponseEntity<>(typeRepository.save(_type), HttpStatus.OK);
    }

    //Delete Type By Id
    @DeleteMapping("/types/{typeId}")
    public ResponseEntity<HttpStatus> deleteType(@PathVariable("typeId") int typeId) {
        typeRepository.deleteById(typeId);
        return new ResponseEntity<>(HttpStatus.OK);
    }












}
