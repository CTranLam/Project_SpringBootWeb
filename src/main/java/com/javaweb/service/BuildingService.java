package com.javaweb.service;

import com.javaweb.model.dto.BuildingEditDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(long buildingId);
    List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest);
    BuildingEditDTO buildingEdit(BuildingEditDTO buildingEditDTO);
}
