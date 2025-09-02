package com.javaweb.service;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

public interface BuildingService {
    ResponseDTO listStaffs(long buildingId);
    BuildingSearchResponse listBuildings(BuildingSearchRequest buildingSearchRequest);
}
