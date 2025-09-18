package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.BuildingEditDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(long buildingId);
    List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest);
    BuildingEditDTO buildingEdit(BuildingEditDTO buildingEditDTO);
    BuildingEditDTO findBuildingEdit(Long id);
    void deleteBuildings(List<Long> ids);
    void assignmentStaff(Long buildingId, List<Long> staffIds);
    Page<BuildingSearchResponse> searchBuildings(String name, Pageable pageable);
    String storeFile(MultipartFile file, Long buildingId);
}
