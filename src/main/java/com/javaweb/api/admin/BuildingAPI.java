package com.javaweb.api.admin;

import com.javaweb.model.dto.AssigntmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value="buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @PostMapping
    public BuildingDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){

        return buildingDTO;
    }


    @DeleteMapping("/{ids}")  // nhan bang params + pathvariable
    public void deleteBuilding(@PathVariable List<Long> ids){
        // xuong DB xoa building theo danh sach id gui ve
        System.out.println("Xoa thanh cong");
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result =  buildingService.listStaffs(id);
        return result; // quang ra view tra ve dang json
    }

    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssigntmentBuildingDTO assignmentBuildingDTO){
        System.out.println("ok");
        // xuong DB
    }
}
