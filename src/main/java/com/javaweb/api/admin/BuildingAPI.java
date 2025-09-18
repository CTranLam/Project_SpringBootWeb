package com.javaweb.api.admin;

import com.javaweb.model.dto.AssigntmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.BuildingEditDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssigmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController(value="buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private RentAreaService rentAreaService;

    @Autowired
    private AssigmentBuildingService assigmentBuildingService;

    // done
    @PostMapping
    public BuildingEditDTO addOrUpdateBuilding(@ModelAttribute BuildingEditDTO buildingEditDTO,
                                               @RequestParam(name = "imageFile", required = false)MultipartFile imageFile){
        // luu file vao DB
        if(imageFile != null && !imageFile.isEmpty()){
            String filePath = buildingService.storeFile(imageFile, buildingEditDTO.getId());
            buildingEditDTO.setLinkofbuilding(filePath);
        }
        // luu DTO vao DB
        return buildingService.buildingEdit(buildingEditDTO);
    }

    // done
    @DeleteMapping
    public void deleteBuilding(@RequestBody List<Long> ids){
        // xuong DB xoa building theo danh sach id gui ve
        if(ids == null || ids.isEmpty()){
            return;
        }
        rentAreaService.deleteRentArea(ids);
        assigmentBuildingService.deleteAssignmentBuildings(ids);
        buildingService.deleteBuildings(ids);
    }

    // done
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result =  buildingService.listStaffs(id);
        return result; // quang ra view tra ve dang json
    }

    // done
    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssigntmentBuildingDTO assignmentBuildingDTO){
        buildingService.assignmentStaff(assignmentBuildingDTO.getBuildingId(),assignmentBuildingDTO.getStaffs());
    }

    @GetMapping("/search")
    public Page<BuildingSearchResponse> searchBuildings(
            @RequestParam(defaultValue = "") String name,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy
    ){
        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy).ascending());
        Page<BuildingSearchResponse> result =  buildingService.searchBuildings(name, pageable);
        return result;
    }
}
