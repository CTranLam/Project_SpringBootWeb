package com.javaweb.controller.admin;



import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.BuildingEditDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private UserService userService;
    // use ModelAndView must use status Get
    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        //Xuong DB lay data xong
        List<BuildingSearchResponse> responseList = new ArrayList<BuildingSearchResponse>();

        mav.addObject("buildingReponseList",responseList);
        mav.addObject("listStaffs",userService.getStaffs());
        mav.addObject("districts" , District.type());
        mav.addObject("typeCodes" , TypeCode.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit")BuildingEditDTO buildingEditDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts" , District.type());
        mav.addObject("typeCodes" , TypeCode.type());
        return mav;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        // xuong DB tim building theo id
       BuildingEditDTO buildingEditDTO = new BuildingEditDTO();
        buildingEditDTO.setId(id);
        buildingEditDTO.setName("ACM Building 1");
        mav.addObject("buildingEdit",buildingEditDTO);
        mav.addObject("districts" , District.type());
        mav.addObject("typeCodes" , TypeCode.type());
        return mav;
    }
}
