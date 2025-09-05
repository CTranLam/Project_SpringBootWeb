package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingSearchResponseConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingEntity.getStreet()+", "+buildingEntity.getWard()+", "
                + District.getDistrictNameByCode(buildingEntity.getDistrict()));
        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreas();
        String areaResult = rentAreas.stream().map(item ->item.getValue().toString()).collect(Collectors.joining(", "));
        buildingSearchResponse.setRentArea(areaResult);
        return buildingSearchResponse;
    }
}
