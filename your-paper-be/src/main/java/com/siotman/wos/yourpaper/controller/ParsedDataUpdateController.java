package com.siotman.wos.yourpaper.controller;

import com.siotman.wos.yourpaper.domain.dto.ParsedDataDto;
import com.siotman.wos.yourpaper.service.ParsedDataUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping(value = "/parsedData")
public class ParsedDataUpdateController {
    @Autowired
    ParsedDataUpdateService parsedDataUpdateService;

    @PostMapping(value = "/updatePaperData")
    public void updateParsedData(@RequestBody ParsedDataDto parsedDataDto) {
        parsedDataUpdateService.updateParsedData(parsedDataDto);
        return;
    }

    @PostMapping(value = "/updateTcData")
    public void updateTcData(@RequestBody ParsedDataDto parsedDataDto) {
        parsedDataUpdateService.updateTcData(parsedDataDto);
        return;
    }
}
