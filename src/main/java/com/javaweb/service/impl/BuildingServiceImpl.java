package com.javaweb.service.impl;

import com.javaweb.converter.BuildingEditDTOConverter;
import com.javaweb.converter.BuildingEntityConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingEditDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.RequestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;
    @Autowired
    private BuildingEditDTOConverter buildingEditDTOConverter;
    @Autowired
    private BuildingEntityConverter buildingEntityConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public ResponseDTO listStaffs(long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get(); // tim kiem toa nha
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF"); // lay het nhan vien
        List<UserEntity> staffAssignments = building.getAssignmentBuildingEntities().stream().map(AssignmentBuildingEntity::getStaff).collect(Collectors.toList()); // lay nhan vien duoc phan cong
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity item : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if(staffAssignments.contains(item)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest) {
        buildingSearchRequest = RequestUtils.normalize(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.searchComplex(buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity buildingEntity : buildingEntities){
            BuildingSearchResponse tmp = buildingSearchResponseConverter.toBuildingDTO(buildingEntity);
            result.add(tmp);
        }
        return result;
    }

    @Override
    public BuildingEditDTO buildingEdit(BuildingEditDTO buildingEditDTO) {
        BuildingEntity buildingEntity;
        if(buildingEditDTO.getId() != null){
            buildingEntity = buildingRepository.findById(buildingEditDTO.getId()).get();
        }
        else{
            buildingEntity = new BuildingEntity();
        }
        buildingEditDTOConverter.updateEntityFromDTO(buildingEditDTO,buildingEntity);
        BuildingEntity buildingEntitySave = buildingRepository.save(buildingEntity);

        // Neu DTO gui rentArea
        if(buildingEditDTO.getRentArea() != null && !buildingEditDTO.getRentArea().isEmpty()){
            rentAreaRepository.deleteByBuilding_Id(buildingEditDTO.getId());
            List<Long> rentArea = Arrays.stream(buildingEditDTO.getRentArea().split(",")).map(String::trim).filter(s -> !s.isEmpty()).map(Long::parseLong).collect(Collectors.toList());
            for(Long value : rentArea){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuilding(buildingEntitySave);
                rentAreaEntity.setValue(value);
                rentAreaRepository.save(rentAreaEntity);
            }
        }

        BuildingEditDTO buildingEditDTOResponse = buildingEntityConverter.buildingEntityToBuildingEditDTO(buildingEntitySave);
        return buildingEditDTOResponse;
    }
}
