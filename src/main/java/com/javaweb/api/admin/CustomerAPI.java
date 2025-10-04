package com.javaweb.api.admin;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("api/customer")
public class CustomerAPI {

    @Autowired
    private BuildingService buildingService;

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        System.out.println("ok");
    }

    @PostMapping("/transaction")
    public void addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO){
        System.out.println("ok");
    }
}
