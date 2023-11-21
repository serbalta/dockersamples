package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class DataController {
    @GetMapping("/data")
    SomeData get() {
        var ret = new SomeData();
        ret.setName("ILV Microservice Architecture");
        return ret;
    }
}

class SomeData {
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String name;
}