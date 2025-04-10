package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicInteger;

@RestController
class DataController {

    private AtomicInteger callsCount = new AtomicInteger(0);

    @GetMapping("/data")
    SomeData get() {
        callsCount.incrementAndGet();
        var ret = new SomeData();
        ret.setName("ILV Microservice Architecture");
        return ret;
    }

    @GetMapping(value = "/metrics", produces = "text/plain")
    String metrics() {
        return "# HELP calls_count Total number of calls\n" +
                "# TYPE calls_count counter\n" +
                "calls_count " + callsCount.get() + "\n";
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