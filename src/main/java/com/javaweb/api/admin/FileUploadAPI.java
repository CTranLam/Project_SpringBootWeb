package com.javaweb.api.admin;

import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

// Demo upload file
@RestController
@RequestMapping("/api/upload")
public class FileUploadAPI {

    @Autowired
    private BuildingService buildingService;

    @PostMapping("/building/{buildingId}")
    public ResponseEntity<String> uploadBuildingImage(
            @PathVariable Long buildingId,
            @RequestParam("file") MultipartFile file
    ) {
        String path = buildingService.storeFile(file, buildingId);
        return ResponseEntity.ok(path);
    }
}

