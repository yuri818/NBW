package com.finalpj.nbw.event.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@RequestMapping("/event/*")
@Controller
public class EventController {

    @GetMapping("List")
    public String eventList() {
        return "/event/eventList";
    }
 @GetMapping("detail")
    public String eventDetail() {
        return "/event/eventDetail";
    }
}
