package com.example.demo.controller;

import com.example.demo.model.Account;
import com.example.demo.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class AccountController {

    //@JsonBackReference to prevent endless loops of json objects while creating a request
    //If you are using jsonbackreference add after it (value = "some kind of name for the reference")

    @Autowired
    AccountRepository accountRepository;

    //wired to the Repository
    
    //All Accounts
    @GetMapping("/accounts")
    public ResponseEntity<List<Account>> getAllAccounts(@RequestParam(required = false)String id){
        List<Account> accounts = new ArrayList<>();
        accounts = accountRepository.findAll();
        return new ResponseEntity<>(accounts,HttpStatus.OK);
    }


    //Show Account by ID
    @GetMapping("/accounts/{accountId}")
    public ResponseEntity<Account> getAccountById(@PathVariable("accountId") int accountId) {
        Optional<Account> _account = accountRepository.findById(accountId);
        return new ResponseEntity<>(_account.get(), HttpStatus.OK);
    }


    //Create Account
    @PostMapping("/accounts")
    public ResponseEntity<Account> createAccount(@RequestBody Account account) {
        //The order matters, start with the Parent table!
        //_account is necessary
        Account _account = accountRepository.save(account);
        return new ResponseEntity<>(_account, HttpStatus.CREATED);

    }


    //Update Account fields by Id
    @PutMapping("/accounts/{accountId}")
    public ResponseEntity<Account> updateAccount(@PathVariable("accountId") int accountId, @RequestBody Account account) {
        Optional<Account> accountData = accountRepository.findById(accountId);
        Account _account = accountData.get();
        _account.setFirstName(account.getFirstName());
        _account.setSecondName(account.getSecondName());
        _account.setPhoneNumber(account.getPhoneNumber());
        _account.setEmail(account.getEmail());
        _account.setZip(account.getZip());
        _account.setDistrict(account.getDistrict());
        _account.setCity(account.getCity());
        _account.setUsername(account.getUsername());
        _account.setPassword(account.getPassword());
        return new ResponseEntity<>(accountRepository.save(_account), HttpStatus.OK);
    }

    //Delete Account by Id
    @DeleteMapping("/accounts/{accountId}")
    public ResponseEntity<HttpStatus> deleteAccount(@PathVariable("accountId") int accountId) {
        accountRepository.deleteById(accountId);
        return new ResponseEntity<>(HttpStatus.OK);
    }


}


